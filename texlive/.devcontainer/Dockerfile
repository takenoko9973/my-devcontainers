FROM takenokoya9973/alpine-texlive-base:latest

RUN tlmgr update --self --all

COPY .latexmkrc /usr
COPY defaultSettings.yaml /usr/local/texlive/${TEXLIVE_VERSION}/texmf-dist/scripts/latexindent
COPY bib /usr/local/texlive/texmf-local/bibtex/bib/local

RUN mktexlsr

WORKDIR /workdir
