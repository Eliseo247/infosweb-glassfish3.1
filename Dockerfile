FROM openjdk:7u151-jdk-alpine

# Set environment variables
ENV GLASSFISH_PKG=/tmp/glassfish-3.1.2.2.zip \
    GLASSFISH_URL=http://download.oracle.com/glassfish/3.1.2.2/release/glassfish-3.1.2.2.zip \
    GLASSFISH_HOME=/usr/local/glassfish3 \
    MD5=ae8e17e9dcc80117cb4b39284302763f \
    PATH=$PATH:/usr/local/glassfish3/bin

# Download and install GlassFish
RUN wget -q -O $GLASSFISH_PKG $GLASSFISH_URL && \
    echo "$MD5 *$GLASSFISH_PKG" | md5sum -c - && \
    unzip -o $GLASSFISH_PKG -d /binarios && \
    rm -f $GLASSFISH_PKG && \
    \
    # Remove Windows .bat and .exe files to save space
    cd $GLASSFISH_HOME && \
    find . -name '*.bat' -delete && \
    find . -name '*.exe' -delete


# Ports being exposed
EXPOSE 4848 8080 8181



# Copy in and set the entrypoint
COPY docker-entrypoint.sh  /binarios
#RUN chgrp -R 0 /usr/local/docker-entrypoint.sh && \
#    chmod -R g=u /usr/local/docker-entrypoint.sh
#COPY /docker-entrypoint.sh $GLASSFISH_HOME/
RUN chmod 777  /binarios
#RUN chgrp -R 0 /usr/local && \
 #   chmod -R g=u /usr/local
    
    RUN chmod g=u /etc/passwd
  #/usr/local/glassfish3

VOLUME  ["/usr/local/glassfish3"]
VOLUME ["/home/digitalizados"]
WORKDIR /usr/local/glassfish3

USER 1001

---------------------------------------------------------------------------------
CMD ["/bin/sh","/binarios/docker-entrypoint.sh"]
# Set labels usados en OpenShift para describir el build de la imagen
LABEL io.k8s.description="moodle" \
      io.k8s.display-name="moodle apache redhat " \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,moodle,apache" \
      io.openshift.min-memory="4Gi" \
      io.openshift.min-cpu="2" \
      io.openshift.non-scalable="false
