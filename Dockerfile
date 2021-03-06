# base image
FROM node:9

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add node executables to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY app/package.json /usr/src/app/package.json
RUN npm install --silent
RUN npm install react-script@1.1.1 -g --silent

# start app
CMD ["npm", "start"]
