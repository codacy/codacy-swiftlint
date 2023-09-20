FROM codacy-swiftlint-dev as builder

FROM swift:5.8.1-jammy-slim

COPY --from=builder /usr/bin/swiftlint /usr/bin/swiftlint
COPY --from=builder /usr/lib/libsourcekitdInProc.so /usr/lib/libsourcekitdInProc.so

COPY --from=builder /docs /docs
COPY target/native-image/codacy-swiftlint /workdir/
RUN adduser --uid 2004 --disabled-password --gecos "" docker
USER docker
WORKDIR /src
ENTRYPOINT ["/workdir/codacy-swiftlint"]
