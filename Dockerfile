FROM node:alpine as builder
COPY --chown=node:node . /home/node/app
WORKDIR /home/node/app
RUN npm i
RUN npm run build

FROM node:alpine 
WORKDIR /home/node/app
COPY --from=builder /home/node/app/dist /home/node/app/dist
RUN npm install -g http-server
EXPOSE 8080
CMD [ "http-server", "dist" ]