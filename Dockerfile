FROM node:8-alpine as build
COPY package-lock.json .
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# production environment
FROM nginx:1.16.0-alpine
COPY --from=build /build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
