FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY . /opt/katie/
WORKDIR /opt/katie
ENV carton /opt/katie/vendor/bin/carton

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install perl build-essential

RUN ${carton} install --cached

CMD ${carton} exec start_server --daemonize                 \
            --path /var/run/katie.sock                      \
            --log-file /var/log/server_starter.log --       \
    ${carton} exec plackup -Ilib -s Gazelle --workers=10 && \
    nginx
