# build environment
#test change

FROM node:16.15.0 as build

ENV EXPO_TOKEN Z28fLLtRvd2T1aIB5GtR4Lhafp6PQQHYgx-eHUEp
WORKDIR /app
ENV PATH /app/node_modules/.bion:$PATH
COPY package.json ./
#COPY package-lock.json ./
RUN npm install
COPY . ./
RUN npm run test
RUN rm ./package-lock.json
RUN npm install eas-cli --global
RUN npx eas-cli build --profile preview --platform android --non-interactive