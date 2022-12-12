# timelapse
A little tool to make timelapse videos from RTSP streams

---

## How to build the Docker container (recommended)

1. Ensure docker is installed
1. Clone this repo: `git clone https://github.com/mcguirepr89/timelapse.git`
1. Edit `app/timelapse.conf`
1. Edit `crontab.example` if you want to customize the schedule
1. Make `root` the owner of the crontab: `sudo chown root:root crontab.example`
1. Edit `docker-compose.yml` if you want to change the ports `caddy` uses (default 80 & 443)
1. Create volume for `caddy`: `docker create volume caddy_data`
1. Build the containers and bring up the services:
   1. Export your shell's environment for the build:
      (Copy and paste the following into your shell):
      ```
      export TZ=$(readlink -f /etc/localtime)
      export uid=$(id $(whoami) | sed "s/ /\n/g;s/($(whoami))//g" | grep uid)
      export gid=$(id $(whoami) | sed "s/ /\n/g;s/($(whoami))//g" | grep gid)
      ```
   1. Bring up and build your new docker service:
      `docker compose up -d`
      
      **OR**
   1. Just run `bash setup` to do both steps above in one go
