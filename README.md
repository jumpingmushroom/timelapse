# timelapse
Forked from https://github.com/mcguirepr89/timelapse and rewritten to only run a container with the timelapse script itself.

---

## How to build the Docker container (recommended)
1. Ensure docker is installed
2. Clone repo
3. Edit docker-compose.yml environment variables to match your setup
4. Edit crontab.example if you want to customize the schedule (optional)
5. Build the containers and bring up the services using docker compose up -d

## TODO
- Find a way to support multiple camera url's in the same container
- Add better file management of generated videos