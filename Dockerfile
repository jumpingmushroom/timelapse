FROM alpine:3.17
LABEL maintainer="johnny@jumpingmushroom.com" 

ENV PROJECTNAME=timelapse
# TODO: Should be auto-generated inside container with ${date} ie.
ENV STARTDATE=date-goes-here
ENV FPS=30
ENV RTSP_STREAM='rtsp://admin:PASSWORD@ip.add.r.ess:554/cam/url'

ENV FFMPEG_LOGGING='-loglevel error -hide_banner'
ENV STILLS="/data/stills"
ENV VIDEOS="/data/videos"
ENV ASSEMBLY="/data/assembly"

WORKDIR /

RUN apk add --no-cache bash ffmpeg busybox-openrc libcap \
  && setcap cap_setgid=ep /bin/busybox

RUN mkdir /app
COPY timelapse.sh /app
RUN chmod +x /app/timelapse.sh

COPY crontab /var/spool/cron/crontabs/timelapser

VOLUME /data

ENTRYPOINT ["crond", "-f"]