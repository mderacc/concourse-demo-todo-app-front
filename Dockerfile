FROM node:8 
RUN npm install -g http-server
COPY /dist /dist
EXPOSE 8080
CMD [ "http-server", "dist" ]