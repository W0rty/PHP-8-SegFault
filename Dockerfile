FROM debian:latest

RUN \
    apt -y update; \
    apt install -y lsb-release gnupg ca-certificates apt-transport-https software-properties-common git nano wget zip unzip gdb python3

RUN \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list ;\
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - ;\
    apt -y update; apt -y install php8.0

RUN apt install strace ; \
    git clone https://github.com/longld/peda.git ~/peda ;\
    echo "source ~/peda/peda.py" >> ~/.gdbinit


WORKDIR /var/www/

RUN rm /var/www/html/*;

WORKDIR /var/www/html/
COPY ./data/ /var/www/html/

CMD ["/bin/bash"]
