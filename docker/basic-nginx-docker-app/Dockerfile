FROM nginx
COPY index.html /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
RUN date +%F_%T_%Z >> ./index.html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]


FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/index.html
