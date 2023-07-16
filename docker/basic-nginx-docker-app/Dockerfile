FROM nginx
# pass -e IMAGE_BUILD_DATETIME=$(/usr/bin/date +%F_%T_%Z) during build
#ENV IMAGE_BUILD_DATETIME
ENV IMAGE_BUILD_DATETIME=2023-07-16_17:59
# pass -e IMAGE_BUILD_DATETIME=$(/usr/bin/date +%F_%T_%Z) during build

#RUN /usr/bin/sed "/h1.*Welcome to.*/a \<h2\> This index.html file created on $(/usr/bin/date  +%F_%T_%Z)\<\/h2\>" index.html
COPY index.html /usr/share/nginx/html/
#RUN /usr/bin/sed -i "/h1.*Welcome to.*/a This index.html file created on 15-JUL-2023_12:20PM-- " /usr/share/nginx/html/index.html
#RUN /usr/bin/sed -i "/h1.*Welcome to.*/a This index.html file created on  $(/usr/bin/date  +%F_%T_%Z)  ==== " /usr/share/nginx/html/index.html

RUN echo "Hey there! BUILD Datetime set in ENV variable IMAGE_BUILD_DATETIME = $IMAGE_BUILD_DATETIME"
RUN /usr/bin/sed -i "/h1.*Welcome to.*/a This index.html file created on ${IMAGE_BUILD_DATETIME}  ==== " /usr/share/nginx/html/index.html
#RUN /usr/bin/cp /usr/share/nginx/html/index.html /tmp/index.html

WORKDIR /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

