############################################################
# Nginx Installed Container
# Based on Ubuntu
# 
# VERSION 0.1
############################################################
FROM stackbrew/ubuntu

# File Author / Maintainer
MAINTAINER Tom Li "nklizhe@gmail.com"

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# Install Nginx
# Install necessary tools
RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
RUN apt-get install -y nginx 

RUN mkdir /var/www
RUN echo "<html><body>Nginx is Working!</body></html>" > /var/www/index.html

ADD default /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start