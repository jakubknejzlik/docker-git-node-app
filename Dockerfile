FROM node

ENV NODE_VERSION stable
ENV NPM_SCRIPT start
ENV GIT_URL https://github.com/heroku/node-js-sample
ENV PORT 30000

#RUN useradd --user-group --create-home --shell /bin/false app

COPY . /code

WORKDIR /code

#RUN chown -R app:app /code/*
RUN chmod +x /code/bootstrap.sh

RUN npm install -g n --silent

ENTRYPOINT ["./bootstrap.sh"]
