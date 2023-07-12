FROM nginx
COPY index.html /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
RUN /usr/bin/date +%F_%T_%Z >> ./index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

