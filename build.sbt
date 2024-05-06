organization := "com.codacy"

name := "codacy-swiftlint"

ThisBuild / scalaVersion := "2.13.14"

enablePlugins(NativeImagePlugin)

enablePlugins(JavaAppPackaging)

libraryDependencies ++= Seq(
      "com.codacy" %% "codacy-engine-scala-seed" % "6.1.2",
      "com.github.pathikrit" %% "better-files" % "3.9.2"
    )

Compile / mainClass := Some("codacy.Engine")

nativeImageOptions ++= Seq("-O1", "-H:+ReportExceptionStackTraces", "--no-fallback", "--no-server")

lazy val `doc-generator` = project
  .settings(
    libraryDependencies ++= Seq(
      "com.codacy" %% "codacy-engine-scala-seed" % "6.1.2",
      "com.lihaoyi" %% "os-lib" % "0.10.0"
    )
  )
  .enablePlugins(JavaAppPackaging)
