FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

# below expose instruction is for elasticbeanstalk only
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html/simple-reactjs-app