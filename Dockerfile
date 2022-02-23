FROM norionomura/swiftlint:0.45.1_swift-5.5.2 as builder

FROM swift:5.5.2-xenial-slim

COPY --from=builder /usr/bin/swiftlint /usr/bin/swiftlint
COPY --from=builder /usr/lib/libsourcekitdInProc.so /usr/lib/libsourcekitdInProc.so

COPY docs /docs
COPY target/graalvm-native-image/codacy-swiftlint /workdir/
RUN adduser --uid 2004 --disabled-password --gecos "" docker
USER docker
WORKDIR /src
ENTRYPOINT ["/workdir/codacy-swiftlint"]
