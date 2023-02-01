FROM node:10

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /node_app

COPY package.json /node_app/
RUN npm install .

COPY . /node_app

RUN node ./node_modules/gulp/bin/gulp generate-assets

CMD ["node","listen-on-port.js"]
