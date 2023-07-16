FROM nginx
RUN /usr/bin/sed "/h1.*Welcome to.*/a \<h2\> This index.html file created on $(/usr/bin/date  +%F_%T_%Z)\<\/h2\>" index.html
COPY index.html /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

