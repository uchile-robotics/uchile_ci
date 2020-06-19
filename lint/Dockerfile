FROM ubuntu:18.04
RUN apt-get update && \
    apt-get -y --no-install-recommends install libxml2-utils yamllint cppcheck python-flake8 && \
    apt-get autoremove -y && \
    apt-get clean
COPY entrypoint.sh /entrypoint.sh
COPY merge_conflict.sh /lint/merge_conflict.sh
COPY cpp.sh /lint/cpp.sh
COPY python.sh /lint/python.sh
COPY xml.sh /lint/xml.sh
COPY yaml.sh /lint/yaml.sh
COPY yamllint.yml /lint/yamllint.yml
ENTRYPOINT ["/entrypoint.sh"]
