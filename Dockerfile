FROM sphinxdoc/sphinx:latest
LABEL "maintainer"="Moritz Willmann <moritz.willmann@ipa.fraunhofer.de>"

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action

ENTRYPOINT ["/entrypoint.py"]
