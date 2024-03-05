FROM node:alpine

WORKDIR /usr/app

COPY . /usr/app

RUN npm install

EXPOSE 5173

CMD ["npm", "run", "dev"]
