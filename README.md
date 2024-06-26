
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/c19f9b18251e4dc5bce89b0a70d0bc70)](https://app.codacy.com/gh/codacy/codacy-swiftlint?utm_source=github.com&utm_medium=referral&utm_content=codacy/codacy-swiftlint&utm_campaign=Badge_Grade_Settings)
[![Build Status](https://circleci.com/gh/codacy/codacy-swiftlint.svg?style=svg)](https://circleci.com/gh/codacy/codacy-swiftlint)

# Codacy Swiftlint

This is the docker engine we use at Codacy to have [Swiftlint](https://github.com/realm/SwiftLint) support.
You can also create a docker to integrate the tool and language of your choice!
See the [codacy-engine-scala-seed](https://github.com/codacy/codacy-engine-scala-seed) repository for more information.

## Usage

You need to create the DEV image:

```bash
sbt stage
docker build -t codacy-swiftlint-dev -f Dockerfile.dev .
```

then you can create the docker by doing:
**note**  The works only on Linux for now, for local test use the DEV image

```bash
sbt nativeImage
docker build -t codacy-swiftlint .
```

The docker is ran with the following command:

```bash
docker run -it -v $srcDir:/src  <DOCKER_NAME>:<DOCKER_VERSION>
```

## Generate docs
Build the DEV image and then run:
```
CONTAINER=$(docker run -d --entrypoint sh -it --rm codacy-swiftlint-dev)
docker cp $CONTAINER:/docs .
docker kill $CONTAINER
```

## Test

For a faster development loop you can create a Docker image based on the JVM instead of creating a native-image:

```bash
sbt universal:stage
docker build -t codacy-swiftlint-dev -f Dockerfile.dev .
```

We use the [codacy-plugins-test](https://github.com/codacy/codacy-plugins-test) to test our external tools integration.
You can follow the instructions there to make sure your tool is working as expected.

## What is Codacy?

[Codacy](https://www.codacy.com/) is an Automated Code Review Tool that monitors your technical debt, helps you improve your code quality, teaches best practices to your developers, and helps you save time in Code Reviews.

### Among Codacy’s features:

 - Identify new Static Analysis issues
 - Commit and Pull Request Analysis with GitHub, BitBucket/Stash, GitLab (and also direct git repositories)
 - Auto-comments on Commits and Pull Requests
 - Integrations with Slack, HipChat, Jira, YouTrack
 - Track issues in Code Style, Security, Error Proneness, Performance, Unused Code and other categories

Codacy also helps keep track of Code Coverage, Code Duplication, and Code Complexity.

Codacy supports PHP, Python, Ruby, Java, JavaScript, and Scala, among others.

### Free for Open Source

Codacy is free for Open Source projects.
