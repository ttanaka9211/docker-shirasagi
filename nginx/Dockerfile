FROM nginx:stable

RUN apt-get update && \
	apt-get install -y --no-install-recommends\
	wget \
	git \
	vim \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -f /etc/nginx/conf.d/*

COPY config /etc/nginx/conf.d/

#-c以降の設定ファイルを指定して起動 daemon offでフォアグラウンドで起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
