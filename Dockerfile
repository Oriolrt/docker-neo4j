FROM neo4j:4.2  
MAINTAINER Oriol Ramos Terrades <oriol.ramos@uab.cat>

RUN apt-get update && \
	apt-get install -y apg \
  numactl \
  openssh-client \
	openssh-server \
  vim
ADD entrypoint.sh /entrypoint.sh

RUN mkdir /plugins
RUN mkdir /conf
COPY install/neo4j.conf /conf/
COPY install/*.jar /plugins/

COPY createUser.sh /root/createUser.sh
RUN chmod +x /root/createUser.sh
RUN /root/createUser.sh && rm /root/createUser.sh


EXPOSE 7474
EXPOSE 7687
EXPOSE 22

#ENTRYPOINT "/entrypoint.sh"
