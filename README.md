# Rocket.Chat Deploy to GitPod

Easily deploy Rocket.Chat to GitPod in single click without Docker. For Docker installations

## What Do You Need
* A GitLab account on `gitlab.com` to sign in with GitPod and clone this repo.
    * If you prefer to use GitHub, an mirror is ready for you. [Simply open this link instead.](https://gitpod.io/#https://github.com/AndreiJirohHaliliDev2006/deploy2gitpod-rocket.chat)

## How To Deploy
* Open this repo in Gitpod.
```
https://gitpod.io/#gitlab.com/deploy2gitpod-templates/rocket.chat
```

* It automatically install the dependencies for you during image build.

* Open an terminal and do the follwoing:
    * Edit the L10 of `/lib/systemd/system/rocketchat.service` with `nano`, find `http://localhost:3000/`
    and change it into `https://3000-<workspace-id>.ws-<region-here>.gitpod.io`. Don't forget to replace `<workspace id>`
    to your Gitpod workspace ID and `<region-here>` with the region stuff such as `<us02>`.
    * Type `systemctl enable rocketchat && systemctl start rocketchat` to launch Rocket.Chat.

* Then open an new tab pointing to that port and complete setup.