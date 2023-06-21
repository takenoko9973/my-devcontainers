FROM takenokoya9973/debian-texlive-base:latest

RUN tlmgr update --self --all

COPY .latexmkrc /root
COPY defaultSettings.yaml /usr/local/texlive/${TEXLIVE_VERSION}/texmf-dist/scripts/latexindent

RUN mktexlsr

WORKDIR /workdir
