`docker run imageName:tagName` -- running images in a container
`docker ps` -- active container list
`docker ps -a` -- all containers list
`docker inspect containerId` -- low level info about a container and images
`docker run -it -p 8888:8080 tomcat:8.0` -- changing default port to our system port
`docker logs containerID` -- container logs
`docker image list` -- all images in local
`docker history imageName:tagName` -- image layer info
`docker build -t vendorName/newImagename .` --- building new image from Dockerfile
`docker run -d -p 5000:5000 --link redis imageName` -- linking container

`docker stop containerId` -- stop container
`docker exec -it containerID bash(commandNmae)` -- run commands on running container
`docker exec -it containerId bash` --- enter inside container