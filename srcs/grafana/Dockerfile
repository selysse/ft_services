# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gselyse <gselyse@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/20 23:40:10 by gselyse           #+#    #+#              #
#    Updated: 2021/01/07 15:18:00 by gselyse          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN 	apk update && \
        apk add openrc 

RUN     apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY    srcs/setup.sh /

COPY    srcs/grafana.ini /usr/share/grafana/conf/custom.ini

COPY    srcs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml

COPY    srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/influxdb.yaml

RUN     mkdir -p /var/lib/grafana_dashboards/

COPY    srcs/dashboard.json /var/lib/grafana_dashboards/

EXPOSE  3000

CMD     [ "sh", "setup.sh" ]