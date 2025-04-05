FROM liuchong/rustup:stable-musl

LABEL name="rust-musl-stable"
LABEL version="1.1.2"

LABEL com.github.actions.name="Rust MUSL Builder Slim"
LABEL com.github.actions.description="Provides a Rust MUSL environment"
LABEL com.github.actions.icon="settings"
LABEL com.github.actions.color="orange"

RUN apt-get update && \
    apt-get install -y musl-tools pkg-config libssl-dev && \
    apt-get clean
    
ENV BUILD_DIR=/build \
    OUTPUT_DIR=/output \
    RUST_BACKTRACE=1 \
    BUILD_TARGET=x86_64-unknown-linux-musl \
    OPENSSL_LIB_DIR=/usr/local/ssl/lib \
    OPENSSL_INCLUDE_DIR=/usr/local/ssl/include \
    OPENSSL_STATIC=1 \
    PKG_CONFIG_ALLOW_CROSS=1

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
