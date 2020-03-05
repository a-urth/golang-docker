FROM golang:1.14

# Install docker
RUN apt-get update && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    echo 'deb [arch=amd64 trusted=yes] https://download.docker.com/linux/debian stretch stable' >  /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install --no-install-recommends --quiet --assume-yes \
        docker-ce \
        docker-ce-cli \
        containerd.io && \
    apt-get autoremove --assume-yes && \
    apt-get clean

COPY bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
