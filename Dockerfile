FROM node:slim
WORKDIR /home
COPY package.json yarn.lock /home/
RUN yarn install
COPY ./public ./public
COPY ./src ./src
RUN yarn build
RUN npm install -g get-graphql-schema
COPY ./entrypoint.sh /home
CMD /home/entrypoint.sh
