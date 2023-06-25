FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    git \
    vim
CMD "apt install software-properties-common";"add-apt-repository ppa:ondrej/php";"apt update";"apt install php8.1";"php -v"
