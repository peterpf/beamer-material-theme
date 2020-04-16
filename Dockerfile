# source: https://github.com/thomasWeise/docker-texlive
FROM thomasweise/texlive

RUN apt-get update && apt-get install -y \
    fonts-roboto
