FROM centos:centos7
MAINTAINER Fidencio Garrido. fidencio.garrido@gmail.com
RUN yum -y upgrade && yum -y install initscripts openssl wget tar
WORKDIR /home
RUN wget http://packages.couchbase.com/releases/3.0.1/couchbase-server-community-3.0.1-centos6.x86_64.rpm
RUN wget http://packages.couchbase.com/releases/couchbase-query/dp4/couchbase-query_dev_preview4_x86_64_linux.tar.gz
RUN rpm --install couchbase-server-community-3.0.1-centos6.x86_64.rpm
WORKDIR /opt
RUN mkdir /opt/n1ql
EXPOSE 8091
EXPOSE 8093
WORKDIR /opt/n1ql
RUN tar -xzvf /home/couchbase-query_dev_preview4_x86_64_linux.tar.gz
WORKDIR /home
RUN rm couchbase-server-community-3.0.1-centos6.x86_64.rpm
RUN rm couchbase-query_dev_preview4_x86_64_linux.tar.gz
COPY ./cbase.sh /home/cbase.sh
ENTRYPOINT ["sh","/home/cbase.sh"]