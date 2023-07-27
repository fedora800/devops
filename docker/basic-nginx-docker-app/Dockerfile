FROM nginx

ARG ARG_IMG_BUILD_DT
ENV ENV_BUILD_DATETIME=2023-07-26_13:15

COPY index.html /usr/share/nginx/html/
RUN /usr/bin/sed -i "/h1.*Welcome to.*/a This index.html file created on -> ARG_IMG_BUILD_DT=${ARG_IMG_BUILD_DT} and ENV_BUILD_DATETIME=${ENV_BUILD_DATETIME} " /usr/share/nginx/html/index.html
#RUN /usr/bin/cp /usr/share/nginx/html/index.html /tmp/test_index.html

WORKDIR /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


