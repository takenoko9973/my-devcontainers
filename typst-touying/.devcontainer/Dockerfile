FROM ghcr.io/typst/typst:v0.13.0

RUN apk update;\
    apk add --no-cache  \
        unzip \
        git \
        npm \
        gnuplot \
        msttcorefonts-installer \
        ; \
    npm install -g pnpm;

# 日本語フォント(原ノ味フォント)導入
ARG FONT_FOLDER="/usr/share/fonts"

# COPY fonts/ ${FONT_FOLDER}
COPY local.conf /etc/fonts

WORKDIR ${FONT_FOLDER}
ENV TYPST_FONT_PATHS=${FONT_FOLDER}

RUN wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Bold.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Bold.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Regular.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Regular.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Light.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Light.otf; \
    # \
    # mkdir zip; \
    # wget -q https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip -O zip/NotoSansCJKjp.zip; \
    # wget -q https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip -O zip/NotoSerifCJKjp.zip; \
    # wget -q https://github.com/googlefonts/morisawa-biz-ud-gothic/releases/latest/download/BIZUDGothic.zip -O zip/BIZUDGothic.zip; \
    # unzip -o "zip/*.zip" -d zip; \
    # cp zip/*.ttf .; \
    # cp zip/*.otf .; \
    # rm -rf zip; \
    # \
    update-ms-fonts; \
    fc-cache -fv;
