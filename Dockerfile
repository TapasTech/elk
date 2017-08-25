FROM elasticsearch:5.3.0
RUN apt-get update && apt-get install -y openjdk-8-jdk zip git maven

RUN git clone https://github.com/medcl/elasticsearch-analysis-ik.git
RUN cd elasticsearch-analysis-ik \
  && git checkout tags/v5.3.0 \
  && JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 mvn package

RUN mkdir -p /usr/share/elasticsearch/plugins/ik \
  && cp elasticsearch-analysis-ik/target/releases/elasticsearch-analysis-ik-5.3.0.zip /usr/share/elasticsearch/plugins/ik \
  && cd /usr/share/elasticsearch/plugins/ik \
  && unzip elasticsearch-analysis-ik-5.3.0.zip
