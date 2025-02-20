FROM almalinux:9
RUN dnf install nginx -y
RUN rm -fr /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/index.html
CMD [ "nginx", "-g", "daemon  off;" ]