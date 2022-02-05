# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gselyse <gselyse@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/20 22:04:06 by gselyse           #+#    #+#              #
#    Updated: 2021/01/03 19:07:08 by gselyse          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN 	apk update && \
	apk add openrc 

RUN     apk add nginx supervisor \
        php7 php7-fpm php7-mysqli \ 
        php7-zlib php7-curl php7-mbstring \
        php7-json php7-session

RUN     mkdir -p /www/

RUN     wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
        tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
        rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
        mv phpMyAdmin-5.0.2-all-languages /www/phpmyadmin

COPY 	./srcs/nginx.conf /etc/nginx/conf.d/default.conf

COPY    ./srcs/config.inc.php /www/phpmyadmin/

COPY 	./srcs/supervisord.conf /etc/supervisord.conf

COPY    ./srcs/setup.sh .

RUN 	chmod 711 setup.sh

EXPOSE  5000

CMD     [ "sh", "setup.sh" ]