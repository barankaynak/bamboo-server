FROM atlassian/bamboo-server:7.0.4

USER root

RUN set -x && \
     apt-get update && \
     apt-get install -y --no-install-recommends \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


RUN set -x && \
     apt-get update && \
     apt-get install -y --no-install-recommends \
		docker-ce docker-ce-cli containerd.io \
     && \
     rm -rf /var/lib/apt/lists/*

RUN usermod -aG docker bamboo

USER bamboo
