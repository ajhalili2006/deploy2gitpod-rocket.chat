# Rocket.Chat Deploy to GitPod

Easily deploy Rocket.Chat to GitPod in single click without Docker.

> **WARNING!**: We'll clone the whole Rocket.Chat repo on the `develop` branch which is unstable. Check the release notes
> for any latest release and checkout to that release ith `git checkout release-X.Y.Z` where `X.Y.Z` are the target version
> to checkout.

## What Do You Need
* A GitLab account on `gitlab.com` to sign in with GitPod and clone this repo.
    * If you prefer to use GitHub, an mirror is ready for you. [Simply open this link instead.](https://gitpod.io/#https://github.com/AndreiJirohHaliliDev2006/deploy2gitpod-rocket.chat)

## How To Deploy
> We recommend to see the [Quick Start for Devs](https://docs.rocket.chat/guides/developer/quick-start) for details.

* Open this repo in Gitpod by prefixing the repo link with `gitpod.io/#` and hit Enter. Wait for build to finish.

* The image contains Meteor installation which automatically install Node.js and MongoDB for you. On first build with `meteor npm start`,
this might take up to 10 minutes or longer. Please be patient.

* After the build and you're on the VS Code screen on your browser, open terminal and do the following:
    * Change your working directory to our own copy of the Rocket.Chat repo with `cd ../RocketChat-Dev`.
    * Start anytime with `meteor npm start` and open the web preview for port `3000`.
    * To stop anytime, press `Ctrl + C` on your terminal.

## Updating
* Stop your instance with `Ctrl + C` if its running.

* Do `git fetch --all` then `git pull`. Resolve any merge conflicts.
    * If you're on the `release-X.Y.Z`, visit release notes then checkout to latest release with `git checkout release-A.B.C`.

* Reinstall dependencies with `meteor npm install` and warp up with `meteor npm start`.
