ARG SWIFT_VERSION=5.3

FROM norionomura/swiftlint:0.40.3_swift-$SWIFT_VERSION as builder

FROM swift:$SWIFT_VERSION-xenial-slim as base

COPY --from=builder /usr/bin/swiftlint /usr/bin/swiftlint
COPY --from=builder /usr/lib/libsourcekitdInProc.so /usr/lib/libsourcekitdInProc.so
COPY docs /docs
RUN adduser --uid 2004 --disabled-password --gecos "" docker

FROM base as dev

RUN apt-get update && apt-get install --no-install-recommends -y openjdk-8-jre
COPY target/universal/stage/ /workdir/
RUN chmod +x /workdir/bin/codacy-swiftlint
USER docker
WORKDIR /src
ENTRYPOINT ["/workdir/bin/codacy-swiftlint"]

FROM base

COPY target/graalvm-native-image/codacy-swiftlint /workdir/
USER docker
WORKDIR /src
ENTRYPOINT ["/workdir/codacy-swiftlint"]
