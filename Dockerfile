FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    git \
    python \
    vim
CMD ["echo", "Hello World"]