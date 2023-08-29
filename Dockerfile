FROM node:18.17.1

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

RUN chmod 777 torrents.js

RUN mkdir torrents

ENV YGG_BASE_URL='https://www3.yggtorrent.wtf'
ENV FLARESOLVER_URL='http://localhost:8191'
ENV YGG_USERNAME='username'
ENV YGG_PASSWORD='password'
ENV TRANSMISSION_HOST='192.168.0.25'
ENV TRANSMISSION_PORT='9091'

EXPOSE 3000

CMD [ "npm", "start" ]