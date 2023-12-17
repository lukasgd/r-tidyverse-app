FROM rocker/tidyverse:latest

RUN apt-get update && apt-get -y install \
    python3-pip && \
    pip3 install radian

CMD ["radian"]