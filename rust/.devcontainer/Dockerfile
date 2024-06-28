FROM rust:1.78-slim-bullseye

# RUN - https://docs.docker.jp/engine/reference/builder.html#run
# パッケージの更新とインストール
# apt-get update                  更新を取得
# apt-get install -y <packages>   パッケージをインストール ここで必要なパッケージを指定
# apt-get clean                   aptキャッシュをクリーン
# rm -rf /var/lib/apt/lists/*     キャッシュされている全パッケージリストを削除
# https://docs.docker.jp/engine/articles/dockerfile_best-practice.html
RUN apt-get update; \
    apt-get install -y \
        git \
        pkg-config \
        libssl-dev \
        mingw-w64 \
        ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    rustup target add x86_64-pc-windows-gnu; \
    rustup component add rls rust-analysis rust-src rustfmt clippy; \
    cargo install cargo-edit cargo-watch cargo-update;
