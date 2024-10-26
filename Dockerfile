FROM sphinxdoc/sphinx:8.0.2
LABEL "maintainer"="Moritz Willmann <moritz.willmann@ipa.fraunhofer.de>"

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
        libenchant-2-dev \
        wget \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Install pandoc
RUN TEMP_DEB="$(mktemp)" \
    && wget -O "$TEMP_DEB" 'https://github.com/jgm/pandoc/releases/download/3.1.6.2/pandoc-3.1.6.2-1-amd64.deb' \
    && dpkg -i "$TEMP_DEB" \
    && rm -f "$TEMP_DEB"

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action

ENTRYPOINT ["/entrypoint.py"]
