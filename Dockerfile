# dockerのマルチステージビルドを利用し、資材作成用のnodeコンテナでdistを作成し、nginxにデプロイする
# ビルド環境
FROM node:lts-alpine as build-stage
# docker-compose or タスク定義などから環境を渡す
ARG NODE_ENV_PARAM

WORKDIR /app
# Dockerfileのビルド時にキャッシュを使えるように変更の少ないpackage.jsonを先にnpm installしておく
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . .
# npm run buildの代わりにgenerateで静的ホスティング用資材作成
RUN npm run generate:$NODE_ENV_PARAM

# 実行環境
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY ./default.conf /etc/nginx/conf.d/default.conf.template
EXPOSE 80
CMD /bin/sh -c "envsubst '\$API_DOMAIN' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
