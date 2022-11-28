FROM swift:5.4.3-amazonlinux2 AS builder

RUN yum update && yum install -y libcurl-devel libxml2-devel

RUN git clone https://github.com/realm/SwiftLint.git
WORKDIR /SwiftLint
RUN git checkout 0.43.1
ENV SWIFT_FLAGS="--configuration release -Xswiftc -static-stdlib -Xlinker -lCFURLSessionInterface -Xlinker -lCFXMLInterface -Xlinker -lcurl -Xlinker -lxml2"
RUN swift build ${SWIFT_FLAGS} --product swiftlint && install -v `swift build ${SWIFT_FLAGS} --show-bin-path`/swiftlint /usr/bin


FROM swift:5.4.3-amazonlinux2-slim

COPY --from=builder /usr/bin/swiftlint /usr/bin/swiftlint
COPY --from=builder /usr/lib/libsourcekitdInProc.so /usr/lib/libsourcekitdInProc.so

COPY docs /docs
COPY target/graalvm-native-image/codacy-swiftlint /workdir/

RUN yum update && yum install -y shadow-utils adduser && yum clean all && adduser -s /bin/false -u 2004 docker
USER docker
WORKDIR /src
ENTRYPOINT ["/workdir/codacy-swiftlint"]
