FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.4.2

WORKDIR /tmp

RUN wget -q https://github.com/WorksApplications/elasticsearch-sudachi/releases/download/v6.4.2-1.1.0/analysis-sudachi-elasticsearch6.4.2-1.1.0.zip \
 && elasticsearch-plugin install file:///tmp/analysis-sudachi-elasticsearch6.4.2-1.1.0.zip \
 && rm analysis-sudachi-elasticsearch6.4.2-1.1.0.zip
RUN wget -q https://github.com/WorksApplications/Sudachi/releases/download/v0.1.1/sudachi-0.1.1-dictionary-core.zip \
 && unzip sudachi-0.1.1-dictionary-core.zip \
 && mkdir -p /usr/share/elasticsearch/config/sudachi \
 && mv system_core.dic /usr/share/elasticsearch/config/sudachi \
 && rm sudachi-0.1.1-dictionary-core.zip
RUN wget -q https://github.com/WorksApplications/Sudachi/releases/download/v0.1.1/sudachi-0.1.1-dictionary-full.zip \
 && unzip sudachi-0.1.1-dictionary-full.zip \
 && mv system_full.dic /usr/share/elasticsearch/config/sudachi \
 && rm sudachi-0.1.1-dictionary-full.zip

COPY sudachi.json /usr/share/elasticsearch/config/sudachi/
