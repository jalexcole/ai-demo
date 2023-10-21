FROM fedora

COPY . .

RUN yes | yum install java-latest-openjdk-devel.x86_64
RUN yes | yum install maven
RUN yum search tensorflow