FROM centos
MAINTAINER Vishal

# Define wildfly setup
ARG OPENJDK_VERSION=1.8.0
ARG WILDFLY_VERSION=11.0.0.Final
ARG WILDFLY_USER=wildfly
ARG WILDFLY_PASSWORD=wildfly                   

# Ensure root user is used               
USER root 
# Install required libs
RUN yum update -y
RUN yum install -y sudo

#install unzip utility
RUN yum install -y unzip

# Install OpenJDK
RUN yum install -y "java-${OPENJDK_VERSION}-openjdk-devel"


# Create wildfly service user, then add it to sudoers
RUN useradd -ms /bin/bash ${WILDFLY_USER}
RUN usermod -aG wheel ${WILDFLY_USER}
ARG USER_HOME=/home/${WILDFLY_USER}
 

# Prepare file system for wildfly
ARG WILDFLY_HOME=/usr/local/wildfly
ARG WILDFLY_NAME=wildfly-${WILDFLY_VERSION}
ARG WILDFLY_FILE=${WILDFLY_NAME}.tar.gz
ARG WILDFLY_URL=https://download.jboss.org/wildfly/${WILDFLY_VERSION}/${WILDFLY_FILE}
RUN mkdir -p ${WILDFLY_HOME}
RUN chown -R ${WILDFLY_USER}:${WILDFLY_USER} ${WILDFLY_HOME}

 # Install wildfly server
USER ${WILDFLY_USER}
WORKDIR ${WILDFLY_HOME}

ARG CURL_CMD="curl -k"
RUN ${CURL_CMD} -O ${WILDFLY_URL}
RUN tar -xf ${WILDFLY_FILE} --strip-components 1 --directory ${WILDFLY_HOME}
RUN rm -f ${WILDFLY_FILE}


ENV DB_CONNECTION_STRING=jdbc:mysql://iap.xxx.eu-central-1.rds.amazonaws.com:3306/IAP1
ENV DB_USER=root
ENV DB_PASSWORD=password

EXPOSE 8082
CMD ["./bin/standalone.sh", "-b", "0.0.0.0"]




#unzip the module 
RUN unzip ${WILDFLY_HOME}/modules/com.zip -d ${WILDFLY_HOME}/modules/
#deploy the war

### Command to run the container
# docker container run -it -e DB_HOST=devsrv3.wipo.int -e DB_PORT=3306 -e DB_NAME=IAP1 -e DB_USER=iap1 -e DB_PASSWORD=4y5vRtU[gK8B -p 8082:8082 iap-business
