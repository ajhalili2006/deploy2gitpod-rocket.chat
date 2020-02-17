FROM gitpod/workspace-full

## We use the user 'gitpod' for security reasons. Use 'root' at your risk!
USER gitpod

## We use your timezone, just in case.
ENV tz Your/Timezone

## Securing your GitPod server
RUN sudo apt-get -yg install ufw
RUN sudo ufw default deny incoming
RUN sudo ufw default allow outgoing
RUN sudo ufw allow 22/tcp
RUN sudo ufw allow 443/tcp
RUN sudo ufw enable
RUN sudo ufw status

## Force-brute attacks protection
RUN sudo apt-get install -yg fail2ban

## Docker installation
RUN sudo apt-get update -y && sudo apt-get upgrade -yg
RUN sudo apt-get remove docker docker-engine docker.io containerd runc
RUN sudo apt-get -yg install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo apt-key fingerprint 0EBFCD88
RUN 

## Docker Compose Installation
RUN sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN sudo chmod +x /usr/local/bin/docker-compose
RUN sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
