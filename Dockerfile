FROM redhat/ubi8

# Install Java
RUN dnf install -y java-11-openjdk && dnf clean all

# Set working directory
WORKDIR /opt/tomcat

# Download Tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98.tar.gz

# Extract and rename Tomcat
RUN tar -xvzf apache-tomcat-9.0.98.tar.gz && \
    mv apache-tomcat-9.0.98 tomcat && \
    rm apache-tomcat-9.0.98.tar.gz

# Expose port
EXPOSE 8080

# Set the startup command
CMD ["/opt/tomcat/tomcat/bin/catalina.sh", "run"]
