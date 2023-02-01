FROM node:10

ENV NODE_ENV=production

RUN addgroup --gid 1017 --system appgroup \
  && adduser --uid 1017 --system appuser --gid 1017

WORKDIR /node_app

COPY package.json /node_app/
RUN npm install .

COPY . /node_app

RUN chown -R appuser:appgroup /node_app

USER 1017

RUN node ./node_modules/gulp/bin/gulp generate-assets

CMD ["node", "listen-on-port.js"]
