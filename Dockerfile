FROM node:17.5-alpine3.15
LABEL maintainer='h-makihara<macky0325@gmail.com>'

ARG OWNER=$OWNER
ARG NAME=$NAME
ARG DESCRIPTION=$DESCRIPTION
ARG ADAPTER=$ADAPTER

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --virtual .system-tools \
                                    git \
                                    curl \
                                    bash 

RUN npm install -g yo generator-hubot
WORKDIR /source
USER node
RUN yo hubot --owner=$OWNER \
             --name=$NAME \
             --description=$DESCRIPTION \
             --adapter=$ADAPTER \
             --defaults


