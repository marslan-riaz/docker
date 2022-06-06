FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# second build 

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 

# start nginx is the default command sp it wiil run automatically.
