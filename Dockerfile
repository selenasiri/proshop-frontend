# build state for building frontend assets

FROM node:alpine AS build

WORKDIR /app

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build 


# nginx state for serving content

FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=build /app/build .
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]

#docker build -t selenasiri/proshop-frontend:1.0 -f Dockerfile .
#docker images
#docker run -p 8080:80 -d selenasiri/proshop-frontend:1.0
#docker ps
#curl -i localhost:8080
___________________________________________________________________
#Dockerfile:

# build state for building frontend assets		// Step 1:

FROM node:12.19.0-alpine3.10 AS build			// Start here

WORKDIR /app

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build 								// Will appear in package.json


# nginx state for serving content				// Step 2:

FROM nginx:alpine

WORKDIR /usr/share/nginx/html					// This folder has the server root directory

RUN rm -rf ./*									// Remove what exists already (bc it's only a test)

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf	// Override what existed in the folder before

COPY --from=build /app/build .							// Copy what we built in Step 1 above.
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]

#docker build -t selenasiri/weather:1.0 -f Dockerfile .
#docker images
#docker run -p 8080:80 -d selenasiri/weather:1.0
#docker ps
#curl -i localhost:8080
# go to http://localhost:8080/  in chrome

#if have error in build image, my solution: rm 3 party modules and re-install them again:
  # 519  rm -fr node_modules *lock*
  # 520  rm -fr build
  # 521  npm i
  # 522  docker container prune
  # 523  docker image prune
  # 524  docker build -t selenasiri/weather:1.0 -f Dockerfile .