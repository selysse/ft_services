# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gselyse <gselyse@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/20 12:36:47 by gselyse           #+#    #+#              #
#    Updated: 2021/01/03 19:04:57 by gselyse          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN 	apk update && \
		apk add openrc

RUN		apk add influxdb

EXPOSE  8086

CMD     [ "influxd" ]