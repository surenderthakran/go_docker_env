##Go Docker Environment
[http://surenderthakran.com](http://surenderthakran.com)

###Salient Features:
- Runs on `Go 1.7.3`
- Docker images based on `Ubuntu 16.04`
- Architecture and dependencies are encapsulated in [docker](https://www.docker.com/) images hence making the dev and production environment COMPLETELY independent of host machine.
- In Development Environment:
    - Provides simple development environment setup with docker-compose.
    - Provides save detection and auto restart using [reflex](https://github.com/cespare/reflex).

###How To Use:
####To build docker image for the go application:
```
docker build -t go_app .
```

####To run docker container:
```
docker run -it -d --name go_app_1 --net=host go_app
```
With `--net=host` the container will listen for requests on port `18770`.

To listen on a different port (ex: `80`) run:
```
docker run -it -d --name go_app_1 -p 80:18770 go_app
```

####To set up development environment:
```
docker-compose build
docker-compose up
```
Above commands will run the blogger docker container with the `src/my_go_project` folder volume mounted.
These will also start [reflex](https://github.com/cespare/reflex) watcher to restart service on save in any Go files under `src/my_go_project`.
Restarting the service involves:
- Running `gofmt` on all files under `src/my_go_project`
- Installing service
- Running test cases
- Running service
