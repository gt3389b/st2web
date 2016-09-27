FROM node:0.10.46-wheezy
LABEL com.stackstorm.service.provides="web"

RUN apt-get update && apt-get install -y vim && rm -rf /var/lib/apt/lists/*

RUN npm install -g gulp

WORKDIR /web

ADD . /web/

RUN npm install

EXPOSE 3000

RUN gulp build
CMD ["gulp", "serve"]
#CMD ["/bin/bash"]
