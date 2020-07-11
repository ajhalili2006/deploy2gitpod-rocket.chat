FROM gitpod/workspace-full

USER gitpod

# Because we're installing in Ubuntu, set this var into noninteractive.
ENV DEBIAN_FRONTEND noninteractive

# Just install the Meteor app.
curl https://install.meteor.com/ | sh

# Then set our working directory to root workspace directory.
WORKDIR /workspace

# Clone the repo!
RUN git clone https://github.com/RocketChat/Rocket.Chat.git RocketChat-Dev

# Install deps
RUN meteor npm install
