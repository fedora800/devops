FROM nginx

ARG ARG_IMG_BUILD_VERSION
ENV ENV_IMG_BUILD_VERSION=$ARG_IMG_BUILD_VERSION


COPY index.html /usr/share/nginx/html/
RUN /usr/bin/sed -i "/h1.*Welcome to.*/a This index.html file built with   ARG_IMG_BUILD_VERSION=${ARG_IMG_BUILD_VERSION}      and ENV_BUILD_DATETIME=${ENV_IMG_BUILD_VERSION} " /usr/share/nginx/html/index.html

WORKDIR /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


