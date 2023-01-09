organization := "com.codacy"

name := "codacy-swiftlint"

ThisBuild / scalaVersion := "2.13.10"

enablePlugins(NativeImagePlugin)

libraryDependencies ++= Seq("com.codacy" %% "codacy-engine-scala-seed" % "6.0.1")

Compile / mainClass := Some("codacy.Engine")

nativeImageOptions ++= Seq(
  "-O1",
  "-H:+ReportExceptionStackTraces",
  "--no-fallback",
  "--no-server",
  "--report-unsupported-elements-at-runtime",
  "--static"
)

lazy val `doc-generator` = project
  .settings(
    libraryDependencies ++= Seq(
      "com.codacy" %% "codacy-engine-scala-seed" % "6.0.1",
      "com.lihaoyi" %% "os-lib" % "0.9.0"
    )
  )
  .enablePlugins(JavaAppPackaging)
