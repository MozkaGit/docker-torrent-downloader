FROM node:18.17.1

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

RUN chmod 777 torrents.js

EXPOSE 3000

CMD [ "npm", "start" ]