FROM node:12-alpine
RUN apk update && apk add --repository https://alpine.secrethub.io/alpine/edge/main --allow-untrusted secrethub-cli

WORKDIR /app

COPY . .
RUN npm install \
    && chown -R node:node .secrethub

USER node
RUN mv .secrethub $HOME/.secrethub

ENTRYPOINT ["secrethub", "run", "--"]
CMD ["npm", "start"]