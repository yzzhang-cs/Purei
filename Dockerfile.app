FROM node:latest

WORKDIR /app
COPY ./app/package.json /app
RUN npm install -g

# Tools for generating new project and development
# Comment/uncomment if needed
RUN npm install -g express-generator
RUN npm install -g sequalize-cli

CMD [ "npm", "start" ]