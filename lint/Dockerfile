FROM ubuntu:18.04
RUN apt-get update && \
    apt-get -y --no-install-recommends install libxml2-utils yamllint && \
    apt-get autoremove -y && \
    apt-get clean
COPY entrypoint.sh /entrypoint.sh
COPY xml.sh /lint/xml.sh
COPY yaml.sh /lint/yaml.sh
COPY yamllint.yml /lint/yamllint.yml
ENTRYPOINT ["/entrypoint.sh"]
