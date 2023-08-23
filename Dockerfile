FROM sphinxdoc/sphinx:latest
LABEL "maintainer"="Moritz Willmann <moritz.willmann@ipa.fraunhofer.de>"

# Install pandoc
RUN TEMP_DEB="$(mktemp)" \
    && wget -O "$TEMP_DEB" 'https://github.com/jgm/pandoc/releases/download/3.1.6.2/pandoc-3.1.6.2-1-amd64.deb' \
    && sudo dpkg -i "$TEMP_DEB"
RUN rm -f "$TEMP_DEB"

RUN apt-get update \
    && apt-get -y install --no-install-recommends libenchant-2-dev \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN 

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action

ENTRYPOINT ["/entrypoint.py"]
