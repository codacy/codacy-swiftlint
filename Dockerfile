FROM codacy-swiftlint-dev as builder

FROM ghcr.io/realm/swiftlint:0.58.2

COPY --from=builder /docs /docs
COPY target/native-image/codacy-swiftlint /workdir/
RUN adduser --uid 2004 --disabled-password --gecos "" docker
USER docker
WORKDIR /src
ENTRYPOINT ["/workdir/codacy-swiftlint"]
