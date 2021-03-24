# a basis of image
FROM	debian:buster

# label
LABEL	maintainer="taeekim@student.42seoul.kr"

# update
RUN apt-get update
RUN apt-get upgrade -y

# install
RUN	nginx \
	mariadb-server \
	php7.3-fpm php-mysql php-mbstring \
	openssl \
	vim \
	wget

# copy content
COPY	./srcs/run.sh ./
COPY	./srcs/default ./tmp
COPY	./srcs/wp-config.php ./tmp
COPY	./srcs/config.inc.php ./tmp

# port
EXPOSE	80 443

CMD 	bash run.sh
