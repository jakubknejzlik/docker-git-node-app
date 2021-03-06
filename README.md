# docker-git-node-app

Docker container for running nodejs applications. The bootstrap contains of these steps:

1) checkout repository
2) run `yarn install`
3) run `npm start`


# Usage

## Docker run

```
docker run -e "GIT_URL=https://github.com/heroku/node-js-sample" -e "PORT=8080" jakubknejzlik/docker-git-node-app
```

## Docker-compose

```
  hello-world:
    image: jakubknejzlik/docker-git-node-app
    container_name: hello-world
    expose:
      - 8080
    environment:
      - GIT_URL=https://github.com/heroku/node-js-sample
      - PORT=8080
```

## Docker-compose with nginx-proxy virtual hosts
```
version: '2'
services:
  nginx-proxy:
    image: jwilder/nginx-proxy
    container_name: nginx-proxy
    ports:
      - "80:80"
    volumes:
      - /var/run/docker.sock:/tmp/docker.sock:ro
  hello-world:
    image: jakubknejzlik/docker-git-node-app
    container_name: hello-world
    expose:
      - 3001
    environment:
      - GIT_URL=https://github.com/heroku/node-js-sample
      - PORT=3001
      - VIRTUAL_HOST=hello.example.com
```


# Environment variables

* `NODE_VERSION` - use specific version for your container (installed via `n`, default: `stable`)
* `NPM_SCRIPT` - script name used for starting your service (default: `start`)
* `GIT_URL` - repository to pull your source code from (example: `https://github.com/heroku/node-js-sample`)
* `PORT` - port for running your service (default: `30000`)
* `YARN_INSTALL` - use `yarn` to install modules (default: `0`)
