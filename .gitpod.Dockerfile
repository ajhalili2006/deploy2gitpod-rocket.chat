FROM gitpod/workspace-full

USER gitpod

# Because we're installing in Ubuntu, set this var into noninteractive.
ENV DEBIAN_FRONTEND noninteractive

# Just install the Meteor app.
RUN curl https://install.meteor.com/ | sh

# Setup our launchpad
WORKDIR /

# Clone REEEEEE
RUN sudo git clone https://github.com/RocketChat/Rocket.Chat.git app
RUN sudo chown gitpod /app/

# Install deps
WORKDIR /app
RUN meteor npm install
