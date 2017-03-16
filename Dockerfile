FROM node
ADD frontend /srv/frontend
WORKDIR /srv/frontend
RUN npm install
RUN npm build
CMD npm start
