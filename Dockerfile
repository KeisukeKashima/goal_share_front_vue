# dockerのマルチステージビルドを利用し、資材作成用のnodeコンテナでdistを作成し、nginxにデプロイする
# ビルド環境
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
# nuxtの場合はgenerate後にdistが作成されるので追加
RUN npm run generate

# 実行環境
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY ./default.conf /etc/nginx/conf.d/default.conf.template
EXPOSE 80
CMD /bin/sh -c "envsubst '\$API_DOMAIN' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
