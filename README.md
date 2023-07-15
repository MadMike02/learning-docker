# DOCKER INTRODUCTION

## DOCKER
Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production.

## The Docker platform
Docker provides the ability to package and run an application in a loosely isolated environment called a `container`. The isolation and security allows you to run many containers simultaneously on a given host. Containers are lightweight and contain everything needed to run the application, so you do not need to rely on what is currently installed on the host. You can easily share containers while you work, and be sure that everyone you share with gets the same container that works in the same way.

Docker provides tooling and a platform to manage the lifecycle of your containers:

- Develop your application and its supporting components using containers.
- The container becomes the unit for distributing and testing your application.
- When you’re ready, deploy your application into your production environment, as a container or an orchestrated service. This works the same whether your production environment is a local data center, a cloud provider, or a hybrid of the two.

## What can I use Docker for?
- `Fast, consistent delivery of your applications`
Docker streamlines the development lifecycle by allowing developers to work in standardized environments using local containers which provide your applications and services. Containers are great for continuous integration and continuous delivery (CI/CD) workflows.

Consider the following example scenario:

    - Your developers write code locally and share their work with their colleagues using Docker containers.
    - They use Docker to push their applications into a test environment and execute automated and manual tests.
    - When developers find bugs, they can fix them in the development environment and redeploy them to the test environment for testing and validation.
    - When testing is complete, getting the fix to the customer is as simple as pushing the updated image to the production environment.

- `Responsive deployment and scaling`
Docker’s container-based platform allows for highly portable workloads. Docker containers can run on a developer’s local laptop, on physical or virtual machines in a data center, on cloud providers, or in a mixture of environments.

Docker’s portability and lightweight nature also make it easy to dynamically manage workloads, scaling up or tearing down applications and services as business needs dictate, in near real time.

- `Running more workloads on the same hardware`
Docker is lightweight and fast. It provides a viable, cost-effective alternative to hypervisor-based virtual machines, so you can use more of your server capacity to achieve your business goals. Docker is perfect for high density environments and for small and medium deployments where you need to do more with fewer resources.

## Docker architecture

Docker uses a client-server architecture. The `Docker client talks` to the `Docker daemon`, which does the heavy lifting of building, running, and distributing your `Docker containers`. The `Docker client` and `daemon` can run on the same system, or you can connect a Docker client to a remote Docker daemon. The `Docker client and daemon communicate using a REST API`, over UNIX sockets or a network interface. Another Docker client is `Docker Compose`, that lets you work with applications consisting of a set of containers.

- `The Docker daemon` : The Docker daemon (dockerd) listens for Docker API requests and `manages Docker objects such as images, containers, networks, and volumes`. A daemon can also communicate with other daemons to manage Docker services.

- `The Docker client` : The Docker client (docker) is the primary way that many Docker users interact with Docker. When you use commands such as `docker run`, the client sends these commands to dockerd, which carries them out. The docker command uses the Docker API. `The Docker client can communicate with more than one daemon`.

- `Docker Desktop` : Docker Desktop is an easy-to-install application for your Mac, Windows or Linux environment that enables you to build and share containerized applications and microservices. `Docker Desktop` includes the `Docker daemon (dockerd)`, `the Docker client (docker)`, `Docker Compose`, `Docker Content Trust`, `Kubernetes`, and `Credential Helper`.

- `Docker registries` : A Docker registry stores Docker images. `Docker Hub` is a public registry that anyone can use, and Docker is configured to look for images on Docker Hub by default. You can even run your own private registry.

When you use the `docker pull` or `docker run commands`, the required images are pulled from your configured registry. When you use the `docker push` command, your image is pushed to your configured registry.

- `Docker objects` : When you use Docker, you are `creating and using images`, `containers`, `networks`, `volumes`, `plugins`, and other objects.

## Images

An image is a `read-only template with instructions for creating a Docker container`. Often, `an image is based on another image`, with some additional customization. For example, you may build an image which is based on the ubuntu image, but installs the Apache web server and your application, as well as the configuration details needed to make your application run.

You might create your own images or you might only use those created by others and published in a registry. To `build your own image`, `you create a Dockerfile` with a simple syntax for `defining the steps needed to create the image and run it`. `Each instruction in a Dockerfile creates a layer in the image`. `When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt`. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

## Containers

A container is a `runnable instance of an image`. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can `connect a container to one or more networks`, `attach storage to it`, or even create a new image based on its current state.

By default, a `container is relatively well isolated from other containers and its host machine`. You can control how isolated a container’s network, storage, or other underlying subsystems are from other containers or from the host machine.

`A container is defined by its image as well as any configuration options you provide to it when you create or start it`. When a container is removed, any changes to its state that are not stored in persistent storage disappear.

## `docker run -i -t ubuntu /bin/bash`

- If you do not have the `ubuntu image` locally, `Docker pulls it from your configured registry`, as though you had run ``docker pull ubuntu`` manually.
- Docker creates a new container, as though you had run a `docker container create` command manually.
- Docker `allocates a read-write filesystem to the container, as its final layer`. This allows a running container to create or modify files and directories in its local filesystem.
- Docker `creates a network interface to connect the container to the default network`, since you did not specify any networking options. This `includes assigning an IP address to the container`. By default, containers can connect to external networks using the host machine’s network connection.
- Docker `starts the container and executes /bin/bash`. Because `the container is running interactively and attached to your terminal (due to the -i and -t flags), you can provide input using your keyboard while the output is logged to your terminal`.
- When you type `exit` to terminate the `/bin/bash command`, the container stops but is not removed. You can start it again or remove it.

## The underlying technology
Docker is written in the `Go programming language` and takes `advantage of several features of the Linux kernel to deliver its functionality`. Docker uses a technology called namespaces to provide the isolated workspace called the container. `When you run a container, Docker creates a set of namespaces for that container`.

`These namespaces provide a layer of isolation. Each aspect of a container runs in a separate namespace and its access is limited to that namespace`.

## Run first container

- `docker run busybox:version` -- repositoryName:tag (pull image and store in local box then create container and run container)
- `docker run busybox:1.24 echo "hello world"` -- run command afer downloading image and create a container and run command in that container
- `docker images ls` -- images in local box
- `docker run busybox:1.24 ls /` -- list out all directory
- `docker run -i -t busybox:1.24` -- interactive(-i) enter in container (cmd excess to it) , alow input output (-t)

## Docker container MORE

In above container is running in foreground (docker run) 
- Docker run starts the proces in the container and attaches the console to the processe's standard input outpu and standar error.
- Default mode for container
- The console cannot be used for other commands after the container is started up.

In detached mode --- the container is running in background

-Containers stated in detached mode and exit when the root process used to run the container exits.
- start with -d option
- We can use other commands also.

`docker run -d busybox:1.24 sleep 1000` (sleep is for delaying execution of command)

`docker ps` -- all running containers
`docker ps -a` -- all container run previosly and current
`docker run --rm busybox:1.24` -- stoping background container
`docker run --name hello_world busybox:1.24`-- set container name
`docker inspect containerId` - low level info about a container and images

## Docker PORT mapping and Docker Logs command

`docker run -it -p 8888:8080 tomcat:8.0` --- it will set the default port of image (8080) to run on localhost port (8888)
`docker run -it -d -p 8888:8080 tomcat:8.0` -- start container as background

`docker logs containerID` -- for container logs

REFERENCE -- https://level-up.one/deep-dive-into-docker-logging/

## WORKING WITH DOCKER IMAGES

kernel -- bootfs---base Image-- image -- image--- container

`docker history busybox:1.24` -- images layer list

- All changes made into running containers will be written into the writable layer.
- When the container is deleted, the writable layer is also deleted, but the underlying image remains unchanges.
- Multiple containers can share access to the same underlying image.

### building images
- Commit changes made in docker container
    Spin up a container from base image.
    install git package in container.
    commit changes made in container.

    `docker run -it debian:jessie`
    `apt-get update && apt-get install -y git` -- update and install git with all yes options default
    `docker commit` -- save the changes we made to the docker container's file system to a new image
    exit container and run `docker commit containerId namespack:tagName` -- new image will be created with all new changes
    `docker run -it namespace:tagName` -- new image running

- using docker file
    - Set of instructions
    - each instruction create new image layer
    - touch Dockerfile
    - after file saved `docker build -t vendorName/newImagename .`-- path of docker file
        - docker build command takes the path to the build context as an argument
        - when build starts, docker client would pack all the files in the `build context into a tarball` then `transfer the tarball file to the daemon`.
        - -f to path of dockerFile
    - Each `RUN` command will execute the command on the top writable layer of the container, then commit the container as a new image.
    - The new image is used for the next step in the Dockerfile. So each RUN instructions will create a new image layer.
    - It is recommended to chain the RUN instructions in the Dockerfile to reduce the number of image layers it creates.
    - `docker scan` -- for synk test against images to find vulnerabilities and learn how to fix them.
    - `CMD` instruction specifies what command you want to run when the container starts up.
    - If we don't specify CMD instruction in the Dockerfile, Docker will use the default command defined in the base image.
    - the CMD instruction doesn't run when building the image, it only runs when the container starts up.
    - You can specify the command in either exec form which is preferred or in shell form.
    - DOCKER CACHE 
        - Each time docker executes an instruction it builds a new image layer.
        - The next time, if the instruction doesn't change, Docker will simply reuse the existing layer.
        - `docker build -t vendor/image . --no-cache=true` -- for invalidating cache
    - Copy instruction
        `COPY` instruction copies new files or directories from build context and adds them to the file system of the container.
    - ADD instruction
        - `ADD` instruction can not only copy files but also allow you to download a file from internet and copy to the container.
        - ADD also can automatically unpack compressed files.
        - Use COPY for the sake of transparency, unless you're absolutely sure you need ADD.
Pushing to docker hub
- docker tag imageId dockerId(form signin dockerhub)/imageName:tagName
- docker login --username=abc
- docker push repostiroyNmae:tag

## containers
- Dockerize web application
- Create Dockerfile in root directory with required specs
- `docker build -t vendorName/imageName:tag .` -- build image
- `docker run -i -p 5000:5000 imageId` --- run image in a container with container port 5000 bind to system 5000 port
- `docker-machine ls` -- default docker machine info
- `docker exec -it containerId bash(commandName)` --- running commands in container
- `ps axu` -- running process

- implementing redis
## redis
- In-memory data structure store, used as database, cache and message broker.
- Built-in applcation and different levels of on-disk persistence.
- widely used in lots of critical products in the field such a twitter timeline service and facebook news feed.

## DOCKER CONTAINER LINKS
allow containers to look for other container and link a connection between them without any exposore of network ports.
two containers -- source and recepient 

`docker run -d --name redis redis:3.2.0` --- start a container names redis from redist image
`docker build -t dockerapp:v0.3 .` -- building image for python from dockerfile
`docker run -d -p 5000:5000 --link redis imageName` -- starting container with link to redis container & in code specified the host of redis as container name 

- main use of docker container links is when we build an application with a microservice architecture, we are able to run many independent components in different containers.
- Docker creates a secure tunnel between the containers that doesn't need to expose any ports externally on the container.

## Docker compose
- previously we starting both container seprately and link them to automate this process we use docker compose
- `docker-compose version`
- create docker-compose.yaml file
- Version-- version of docker compose (uses set of rules)
- Services -- steps to do
- dockerapp - containerName
- build - path of dockerfile (. current directory)
- ports - expose port of container to local machine
    (syntax--> -"containerPort":"localPort")
- depends_on - linking container (the parent will be started first)
- redis: containerName
- image: redis:3.2.0 --- make container from this image

- version 3 of docker compose removes the mentioning of linking the containers. In 2 and above version each container under services can communite between them.

- `docker-compose up` (build all containers and run)

- Docker compose is a very handy tool to quickly get docker environment up and running.

- Docker compose uses yaml files to store the configuration of all the containers, which removes the burden of maintain our scripts for docker orchestration.

## Docker compose workflow

- `docker-compose up -d` -- run compose command in background. --- by default it will only create image if the image is not present
- `docker-compose ps` -- list containers manage by docker compose
- `docker-compose logs` -- logs of all containers
- `docker-compose logs containerName` -- log of that container
- `docker-compose stop` -- all containers stop withour removing them
- `docker-compose start` -- all containers start
- `docker-compose rm --all` -- all containers remove
- `docker-compose build` -- rebuild all images 

## Docker networking

- Default docker uses host machine network then docker daemon is installed on. During installing docker creates a
Bridge (docker0) between the containers and host. The containers use this bridge to connect with each other and outside network using host internet.

- Types of networks: 
    - Closed Network/ None network
    - Bridge Network
    - Host Network
    - Overlay Network
- `docker network ls` -- all network created by docker
- `docker network inspect bridge(networkName)`
- ### Close/None network
    - It creates a closed container which doesn't have acces to any network.
    - `docker run -d --net none busybox`
    - if use `ping 8.8.8.8` -- that connects to goole dns server inside the command line of container then it will not get connected.
    - `ifconfig` -- will show local loopback which means no network and ip will be 127.0.0.1
    - Provides maximum level of network protextion. As there is no internet then breaching container is not possible.
    - Not a good choice if network or internet connection is required. (example - HTTP requests)
    - Suites well where the container require the maximum level of network security and network access is not necessary.
- ### Bridge Network
 - Default type of network
 - `docker run -d --name container_1(containerName) busybox`
 - default range of bridge network - 172.17.0.0 -- 172.17.255.255 --->>> containers will be assigned IP in these ranges only.
 - `ping IP` -- if we ping other container from one it will be pinged via private network between each other.
 - If there are two bridge network then containers of other bridge network cannot be connected with containers in different bridge network.
 - `docker netwok create --driver bridge my_bridge_network` (create new bridge network)
 - `docker run -d --name containerName --net my_bridge_network` --- create container in new network
 - `docker network connect bridge container_3` --by this the container in another network will also get connected with brige network. It will get connected with its previous also.
 - `docker network disconnect bridge container_3` -- removing container from network.
 - In this network container have access to two network interfaces
    - A loopback interface -- for within connections
    - A private interface -- for host connections 
- All containers in the same bridge network can communicate with each other.
- COntainers from different bridge networks can't connect with each other by default.
- Reduces the level of network isolation in favor of better outside connectivity.
- Most suitable where you want to set up a relatively small network on a single host.
- ### Host and overlay Network
- HOST NETWORK
    - THe least protected network model, it adds a container on the host's network stack.
    - COntaiers deployed on the host stack have full access to the host's interface.
    - These type of containers are called `open containers`.
    - `docker run -d --name container_o --net host busybox`
    - Minimum network securtiy level.
    - No isolation on this type of open containers, thus leave the container widely unprotected.
    - Containers running in the host network stack should see a higher level of performance than those traversing the docker0 bridge and iptables port mappings.
- OVERLAY NETWORK (widely used on productions)
- https://docs.docker.com/engine/swarm/#create-a-swarm-cluster
    - And for distributed systems
    - Supports multi-host network out of the box.
    - Requires some pre-existing conditios before it can be created.
        - Running docker engine in `swarm mode`.
        - A key-value store such as `consul`.

- ### Docker containers networks with docker compose
- default network is bridge
-   defining network in docker compose file
    ```
    networks:
        my_net(networkName):
            driver: bridge
    ```
- Isolating networks between container.
    ```
    services:
        proxy: 
            build: ./proxy
            networks:
                - front
        app:
            build: ./app
            networks:
                - front
                - back
        db:
            images: postgres
            networks:
                - back
    networks:
        front:
            driver: custom-driver-1
        back:
            driver: custom-driver-2
            driver-opts:
                foo: "1"
                bar: "2"
    ```

## CREATING A CONTINOUS INTEGRATION PIPELINE

### Write and run unit Tests inside containers
- Unit tests should test some basic functionality of our docker app code, with no reliance on external services.
- Unit tests should run as quickl as possible so that developers can iterate much faster withour being blocked by wating for the tests results.
- Docker containers can spin up in seconds and can create a clean and isolated environment which is great tool to run unit tests with.
- `docker run dockerapp python test.py` --> run command one time in container(dockerapp)

ICORPORTAING UNIT TESTS INTO DOCKER IMAGES-- 
- pros: a single image is used through development, testing and production, which greatly ensures the reliablity of our tests.
- Cons: it increases the size of the image.

### Intro to Continuos integrations:
- Continous integration is a software engineering practice in which isolated changes are immediately tested and reported when they are added to a larger code base.
- The goal of CI is to provide rapid feedback so that if a defect is introduced into the code base, it can be identified and corrected as soon as possible.

- Our CI pipeline-
 code ---> github <=> CircleCI (hosted CI server)

 URL of the Github account to fork:

https://github.com/jleetutorial/dockerapp

Checking for existing SSH keys:

https://help.github.com/articles/checking-for-existing-ssh-keys/

Generating a new SSH key and adding it to the ssh-agent:

https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

Adding a new SSH key to your GitHub account:

https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/

### CI with circle CI
- create account and link repo in new project
- add `.circleci/config.yaml` in root directory and add steps accordingly.
- add environment variables for that project in settings sections and link them in yaml file by `$ENV_VAR_NAME`
- The build will start automatically as soon as we push something on git.  
- CI repo link -- https://github.com/MadMike02/dockerCI