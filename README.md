
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

## Agent Playbook: Updating This Repository End-to-End

This section is written for an AI coding agent (or a human) tasked with updating this repo — most commonly bumping the wrapped SwiftLint version, but also base image / orb / dependency bumps. Follow it top to bottom; it tells you what to change, how to regenerate derived files, how to test locally, and how to interpret CI so you can iterate on failures without guessing.

### 1. What this repository is

This is a **Codacy engine**: a thin Scala wrapper (`src/main/scala`, built on `codacy-engine-scala-seed`, compiled to a GraalVM native-image binary via `sbt-native-image`) that packages [SwiftLint](https://github.com/realm/SwiftLint) as a Docker image Codacy's platform can run against a customer's source code. Unlike some other Codacy engines, this repo does **not** build SwiftLint from source — SwiftLint is consumed as a **pre-built binary from a base Docker image**: `ghcr.io/realm/swiftlint` for the release image, and `norionomura/swiftlint` (which bundles a matching Swift toolchain) for the dev image used to run the doc generator and for faster local iteration.

The `docs/` directory is not just documentation — it is **machine-consumed configuration**:

- `docs/patterns.json` — the full list of SwiftLint rules ("patterns") Codacy knows about, their default severities/categories, and which are enabled out of the box, plus a top-level `"version"` field. Generated file, do not hand-edit.
- `docs/description/description.json` + `docs/description/*.md` — human-readable titles/descriptions per pattern, used in the Codacy UI. Generated file, do not hand-edit.
- `docs/tests/*.swift` and `docs/multiple-tests/*` — fixtures used by `codacy-plugins-test` to validate the engine actually produces the results it claims to for real Swift code samples.
- `docs/tool-description.md` — short blurb about the tool, hand-maintained.

All three generated artifacts above come from **`doc-generator`** (`doc-generator/src/main/scala/doc-generator.scala`), a small Scala program that shells out to the SwiftLint binary itself (`swiftlint generate-docs`, `swiftlint rules -v`, `swiftlint version`) inside the dev Docker image and converts the output into Codacy's `Pattern`/`Tool` JSON model. This means docs can only be regenerated **inside the `codacy-swiftlint-dev` image**, since that's the only place both the correct SwiftLint version and a JVM are present together (see `Dockerfile.dev`, which runs the generator during `docker build`).

### 2. Files that encode versions — check all of these on every update

| File | What it controls | What to check |
|---|---|---|
| `Dockerfile` → `FROM ghcr.io/realm/swiftlint:<version>` | SwiftLint version bundled in the release image | Bump to the target version/tag; confirm the tag exists on `ghcr.io/realm/swiftlint`. |
| `Dockerfile.dev` → `FROM norionomura/swiftlint:<version>_swift-<swift-version>` | SwiftLint version + matching Swift toolchain used for local/dev builds and doc generation | Must be bumped **in lockstep** with `Dockerfile`; also check whether the Swift version suffix needs to change for the new SwiftLint release. |
| `docs/patterns.json` → top-level `"version"` field | The version Codacy displays/tracks for this tool | Regenerated by `doc-generator`, but historically has also been hand-bumped alongside the Docker tags — verify it matches after regeneration. |
| `.circleci/config.yml` → `codacy/base` orb | Shared CircleCI steps (checkout, sbt/docker build helpers) | Check the latest published version. |
| `.circleci/config.yml` → `codacy/plugins-test` orb | Runs `codacy-plugins-test` in CI | Same as above. |
| `build.sbt` → `codacy-engine-scala-seed` version | Codacy's plugin API used by the Scala wrapper and by `doc-generator` | Only bump if explicitly scoped; check for a matching release. |

Past version-bump commits (e.g. `feature: Update Swiftlint to 0.63.2`, `feature: Update Swiftlint to 0.61.0`) touched exactly `Dockerfile`, `Dockerfile.dev`, and `docs/patterns.json`'s version field — use `git log --oneline --all | grep -iE "bump|update|upgrade|version"` to find more examples if you need a template diff.

### 3. Step-by-step update procedure

1. **Bump the SwiftLint version** in both `Dockerfile` and `Dockerfile.dev` (keep them identical), adjusting the Swift toolchain suffix in `Dockerfile.dev` if the new SwiftLint release requires it.
2. **Build the DEV image**, which also regenerates the docs as part of `docker build`:
   ```bash
   sbt universal:stage
   sbt doc-generator/stage
   docker build -t codacy-swiftlint-dev -f Dockerfile.dev .
   ```
3. **Copy the regenerated docs out of the dev image** and review the diff for new/removed/renamed patterns and stale fixture references in `docs/tests/` and `docs/description/`:
   ```bash
   CONTAINER=$(docker run -d --entrypoint sh -it --rm codacy-swiftlint-dev)
   docker cp $CONTAINER:/docs .
   docker kill $CONTAINER
   ```
4. **Check Scalafmt and compile** the Scala wrapper:
   ```bash
   sbt scalafmtCheckAll
   sbt scalafmtSbtCheck
   sbt stage
   ```
5. **Build the release image** (native-image build only works on Linux; use the dev/JVM image above for local iteration on non-Linux machines):
   ```bash
   sbt nativeImage
   docker build -t codacy-swiftlint .
   ```
6. **Run `codacy-plugins-test` locally** before pushing — clone https://github.com/codacy/codacy-plugins-test and run its multi-test mode (this repo's CI uses `run_multiple_tests: true`) against your local image tag, given `docs/tests/` and `docs/multiple-tests/` fixtures.
7. **Iterate on failures**, re-running only the relevant test command after each fix.
8. **Commit** the version bump(s) together with the regenerated `docs/` files in one change.
9. **Push and open a PR.**
10. **Poll the PR's real CI checks until they all pass — local validation is NOT the finish line.** After every push, run `gh pr checks <pr-url>` and keep re-polling (short sleep while any check is `pending`) until all checks finish. If a check fails, fetch its actual log (don't guess), find the true root cause, fix it, push again (never `--no-verify`, never force-push), and re-poll. Repeat until every check is green. **The CI environment's toolchain can differ from your local one**, so a clean local run does not guarantee CI passes. Only stop iterating when every check passes, or you hit a genuine product/infra decision that needs a human.

### 4. Common failure modes and fixes

| Symptom | Likely cause | Fix |
|---|---|---|
| `Dockerfile` and `Dockerfile.dev` reference different SwiftLint versions | Only one file was bumped | Bump both together — CI builds the dev image first, then builds/tests the release image, so a mismatch surfaces as inconsistent doc/pattern behavior between the build steps rather than an obvious error. |
| Doc generation fails or produces an empty `docs/description` | `Dockerfile.dev`'s Swift toolchain suffix doesn't match what the new SwiftLint version needs | Check upstream SwiftLint release notes / `norionomura/swiftlint` tags for the correct `_swift-<version>` suffix. |
| `codacy/publish_docker` step never runs on a PR branch | The CircleCI workflow only publishes on `master` | This is expected — publishing only happens after merge; PR CI should still pass `plugins_test`. |

### 5. Definition of done

- SwiftLint version bumped identically in `Dockerfile` and `Dockerfile.dev` (including the Swift toolchain suffix if needed).
- Docs regenerated via the dev image (`docs/patterns.json`, `docs/description/*`), with fixture inconsistencies in `docs/tests/`/`docs/multiple-tests/` resolved.
- `sbt scalafmtCheckAll` / `sbt scalafmtSbtCheck` and `sbt stage` pass locally.
- Both the dev (JVM) and release (native-image) Docker images build successfully.
- `codacy-plugins-test` (multiple-tests mode) passes locally against the freshly built image.
- **After pushing and opening/updating the PR, every CI check on it is green.** Poll `gh pr checks <pr-url>` and iterate on any failure until all pass.

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
