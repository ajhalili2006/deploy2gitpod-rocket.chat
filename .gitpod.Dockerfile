FROM gitpod/workspace-full

# Sorry, we're gonna go wild. Beware of using root!
USER root

# Because we're installing in Ubuntu, set this var into noninteractive.
ENV DEBIAN_FRONTEND noninteractive

# Install MongoDB
RUN apt-get -y update
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-4.0.list

# We're not using NVM because we're installing Node.js globally.
RUN RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install --yes nodejs
RUN apt-get install -y build-essential mongodb-org graphicsmagick

# Install the needed tools.
RUN apt-get install -y build-essential mongodb-org nodejs graphicsmagick

# Pull stuff
RUN curl -L https://releases.rocket.chat/latest/download -o /tmp/rocket.chat.tgz
RUN tar -xzf /tmp/rocket.chat.tgz -C /tmp

# Create an user called 'rocketchat' and adjust perms.
RUN useradd -M rocketchat && usermod -L rocketchat
RUN chown -R rocketchat:rocketchat /opt/Rocket.Chat

# Use my script for automating stuff.
RUN curl -sL https://gist.githubusercontent.com/AndreiJirohHaliliDev2006/5fac9c422c80eaa96b01cde1823eacce/raw/a294375e06e4261a8302a080ee9f5fe337d78e14/RocketChat-CatStuffToSystemd.sh | bash

# Setup storage engine and replication for MongoDB
RUN sed -i "s/^#  engine:/  engine: mmapv1/"  /etc/mongod.conf
RUN sed -i "s/^#replication:/replication:\n  replSetName: rs01/" /etc/mongod.conf

# Start MongoDB
RUN systemctl enable mongod && systemctl start mongod
RUN mongo --eval "printjson(rs.initiate())"