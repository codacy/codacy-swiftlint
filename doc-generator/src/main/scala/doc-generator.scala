import com.codacy.plugins.api._
import com.codacy.plugins.api.results._
import play.api.libs.json.Json

object Main extends App {
  val tempDir = os.temp.dir()

  os.proc("swiftlint", "generate-docs").call(cwd = tempDir)

  println("Generated docs using swiftlint generate-docs")

  val rulesOutput = os.proc("swiftlint", "rules").call().out.lines().map(_.split('|').map(_.trim).toList.tail).tail

  val version = os.proc("swiftlint", "version").call().out.text().trim

  val excludeList = Set("Rule Directory.md", "Swift Syntax Dashboard.md")

  val mdFiles = os.list(tempDir / "rule_docs").filterNot(file => excludeList.contains(file.last))

  val docsDirectory = os.root / "docs"
  val descriptionDirectory = docsDirectory / "description"

  val patternDescriptions = mdFiles.map { file =>
    println(s"Generating patterns description from ${file.last}")
    val patternId = file.last.stripSuffix(".md")
    val lines = os.read(file).linesIterator
    val title = lines.next().stripPrefix("# ")
    lines.next()
    val description = lines.next()
    Pattern.Description(Pattern.Id(patternId), Pattern.Title(title), Some(Pattern.DescriptionText(description)), None)
  }

  val ids = rulesOutput.head.zipWithIndex.toMap

  case class SwiftlintRule(
      identifier: String,
      correctable: Boolean,
      enabledInYourConfig: Boolean,
      kind: String,
      configuration: String
  )

  val swiftLintRules = rulesOutput.tail
    .filter(_.length == ids.size)
    .map { arr =>
      def toBoolean(s: String) = s == "yes"
      SwiftlintRule(
        identifier = arr(ids("identifier")),
        correctable = toBoolean(arr(ids("correctable"))),
        enabledInYourConfig = toBoolean(arr(ids("enabled in your config"))),
        kind = arr(ids("kind")),
        configuration = arr(ids("configuration"))
      )
    }

  def configurationToLevel(kind: String) =
    Option(kind)
      .collectFirst {
        case s if s.startsWith("warning") => Result.Level.Warn
        case s if s.startsWith("error") => Result.Level.Err
      }
      .getOrElse(Result.Level.Info)

  def kindToCategory(kind: String) = kind match {
    case "style" => Pattern.Category.CodeStyle
    case "lint" => Pattern.Category.ErrorProne
    case "performance" => Pattern.Category.Performance
    case "metrics" => Pattern.Category.Complexity
    case _ => Pattern.Category.ErrorProne
  }

  val patternSpecifications = swiftLintRules.map { swiftLintRule =>
    println(s"Generating patterns specification for ${swiftLintRule.identifier}")
    Pattern.Specification(
      Pattern.Id(swiftLintRule.identifier),
      configurationToLevel(swiftLintRule.configuration),
      kindToCategory(swiftLintRule.kind),
      subcategory = None,
      enabled = swiftLintRule.enabledInYourConfig
    )
  }

  val specification =
    Tool.Specification(Tool.Name("swiftlint"), Some(Tool.Version(version)), patternSpecifications.toSet)

  os.write.over(docsDirectory / "patterns.json", Json.prettyPrint(Json.toJson(specification)) + "\n")
  os.remove.all(descriptionDirectory)
  mdFiles.foreach(os.copy.into(_, descriptionDirectory, replaceExisting = true, createFolders = true))
  os.write.over(descriptionDirectory / "description.json", Json.prettyPrint(Json.toJson(patternDescriptions)) + "\n")
  os.remove.all(tempDir)
}
