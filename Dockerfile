FROM node:21.2.0 as builder

WORKDIR /usr/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Second step , first stp will creat temporary container 
# and second step will take the build folder from first step and use

FROM nginx

COPY --from=builder /usr/app/build /usr/share/nginx/html