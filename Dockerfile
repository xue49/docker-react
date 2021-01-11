FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# elastic beanstalk will map automatically this port for incoming traffic
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html