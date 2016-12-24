##Go Docker Environment
[http://surenderthakran.com](http://surenderthakran.com)

###Salient Features:
- Runs on `Go 1.7.3`

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
Above commands will run the blogger docker container with the `my_go_docker/src/` folder volume mounted.
