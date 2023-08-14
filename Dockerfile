FROM node:lts-alpine

RUN apk add curl
RUN curl -L -s -o /bin/pangea https://github.com/snpranav/secrets-cli/releases/download/v0.1.3/pangea-linux-amd64 && \
        chmod +x /bin/pangea

WORKDIR /app
COPY . .

RUN npm install

ENTRYPOINT ["pangea", "run", "-c"]
CMD ["npm", "run", "dev"]