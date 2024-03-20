organization := "com.codacy"

name := "codacy-swiftlint"

ThisBuild / scalaVersion := "2.13.10"

enablePlugins(NativeImagePlugin)

enablePlugins(JavaAppPackaging)

libraryDependencies ++= Seq("com.codacy" %% "codacy-engine-scala-seed" % "6.1.2")

Compile / mainClass := Some("codacy.Engine")

nativeImageOptions ++= Seq("-O1", "-H:+ReportExceptionStackTraces", "--no-fallback", "--no-server")

lazy val `doc-generator` = project
  .settings(
    libraryDependencies ++= Seq(
      "com.codacy" %% "codacy-engine-scala-seed" % "6.1.2",
      "com.lihaoyi" %% "os-lib" % "0.9.3"
    )
  )
  .enablePlugins(JavaAppPackaging)
