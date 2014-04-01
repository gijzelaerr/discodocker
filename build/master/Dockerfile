FROM gijzelaerr/discobase

# requirements for proxy
RUN apt-get install -y python-pycurl lighttpd

# needed for running ssh and disco services
ADD conf/supervisord.conf /etc/supervisor/conf.d/disco.conf

# expose ssh and disco ports
EXPOSE 22/tcp 8989/tcp 8999/tcp

VOLUME ["/home/disco"]

CMD ["/usr/bin/supervisord"]

