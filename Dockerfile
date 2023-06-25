FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    git \
    vim
COPY abc.txt /src/abc.txt
WORKDIR "/home"
CMD "git clone https://github.com/MadMike02/DSA-C.git"