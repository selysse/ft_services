# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gselyse <gselyse@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/12 15:42:32 by gselyse           #+#    #+#              #
#    Updated: 2021/01/07 19:45:55 by gselyse          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN 	apk update && \
		apk add openrc 

RUN		apk add nginx && \
		apk add supervisor

RUN		apk add openssl && \
		apk add openssh

RUN		adduser -D 'gselyse'; echo "gselyse:admin" | chpasswd;

RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=gselyse' \
		-keyout /etc/ssl/localhost.key \
		-out /etc/ssl/localhost.crt

RUN		mkdir www

COPY	./srcs/index.html /www/

COPY	./srcs/style.css /www/

COPY 	./srcs/nginx.conf /etc/nginx/conf.d/default.conf

COPY 	./srcs/supervisord.conf /etc/supervisord.conf

COPY 	./srcs/setup.sh setup.sh

RUN 	chmod 711 setup.sh

EXPOSE	80 443 22

CMD		[ "sh", "setup.sh" ]
