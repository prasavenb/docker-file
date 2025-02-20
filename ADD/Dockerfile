FROM almalinux:9
RUN dnf install nginx -y
RUN rm -rf /usr/share/nginx/html/index.html
ADD https://github.com/prasavenb/terraform-sg-module/blob/main/readme.MD /usr/share/nginx/html/index.html
CMD [ "nginx", "-g", "daemon off;" ]