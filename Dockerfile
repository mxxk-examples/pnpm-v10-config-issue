FROM node:24-alpine
RUN apk add --no-cache bash
RUN corepack enable
COPY repro repro

RUN \
    cd /repro/pnpm-v9 && \
    pnpm config set \
        --location=project \
        '//npm.pkg.github.com/:_authToken=${NPM_TOKEN}'

RUN \
    cd /repro/pnpm-v10-without-npmrc && \
    pnpm config set \
        --location=project \
        '//npm.pkg.github.com/:_authToken=${NPM_TOKEN}'

RUN \
    cd /repro/pnpm-v10-with-npmrc && \
    pnpm config set \
        --location=project \
        '//npm.pkg.github.com/:_authToken=${NPM_TOKEN}'

WORKDIR /repro
