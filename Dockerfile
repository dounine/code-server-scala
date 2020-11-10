FROM codercom/code-server:latest
User root
RUN mkdir -p /opt/java
COPY ./jdk1.8.0_112 /opt/java/openjdk
COPY ./apache-maven-3.6.3 /opt/java/maven
COPY ./gradle-6.7 /opt/java/gradle
COPY ./scala-2.13.3 /opt/java/scala
ENV JAVA_HOME=/opt/java/openjdk \ 
    M2_HOME=/opt/java/maven \
    SCALA_HOME=/opt/java/scala \
    GRADLE_HOME=/opt/java/gradle
ENV PATH=$JAVA_HOME/bin:$M2_HOME/bin:$GRADLE_HOME/bin:$SCALA_HOME/bin:$PATH
WORKDIR /home/coder/project
ENTRYPOINT ["code-server","--locale","zh-cn","--host","0.0.0.0","--port","8080"]
