FROM gijzelaerr/discobase

ADD conf/supervisord.conf /etc/supervisor/conf.d/disco.conf

EXPOSE 22
EXPOSE 8989
CMD ["/usr/bin/supervisord"]

