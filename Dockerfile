FROM debian:stable-slim
COPY target/release/iroha .
COPY iroha/config.json .
RUN apt-get update && apt-get -y upgrade && apt-get install -y libssl-dev
RUN ln -s -f /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.0
RUN ln -s -f /usr/lib/x86_64-linux-gnu/libssl.so.1.1 /usr/lib/x86_64-linux-gnu/libssl.so.1.0.0 
CMD ["./iroha"]