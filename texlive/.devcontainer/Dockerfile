FROM takenokoya9973/debian-texlive-base:latest

COPY .latexmkrc /root
COPY defaultSettings.yaml /usr/local/texlive/${TEXLIVE_VERSION}/texmf-dist/scripts/latexindent

RUN tlmgr update --self --all; mktexlsr; \
    wget https://api.github.com/repos/jgm/pandoc/releases/latest -q -O - \
        | grep "browser_download_url.*-amd64.deb" \
        | cut -d : -f 2,3 \
        | tr -d \" \
        | wget -qi -; \
    apt-get update; apt-get -y upgrade; \
    apt-get install ./pandoc*.deb; \
    apt-get clean; \
    rm ./pandoc*.deb;
