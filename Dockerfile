FROM codacy-swiftlint-dev as builder

FROM ghcr.io/realm/swiftlint:0.61.0

COPY --from=builder /docs /docs
COPY target/native-image/codacy-swiftlint /workdir/
RUN apt-get update && apt-get install -y adduser
RUN adduser --uid 2004 --disabled-password docker
USER docker
WORKDIR /src
ENTRYPOINT ["/workdir/codacy-swiftlint"]
