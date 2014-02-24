FROM ubuntu
MAINTAINER gijs@pythonic.nl
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y curl erlang-base git make python erlang-parsetools erlang-inets erlang-dev openssh-server supervisor

ADD scripts /scripts

run true

# Add the supervisor configuration file
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# setup ssh
RUN echo root:ska | chpasswd
RUN mkdir /var/run/sshd

## passwordless login for localhost
RUN mkdir -p /root/.ssh
RUN ssh-keygen -N '' -f /root/.ssh/id_dsa
RUN cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys

##RUN /scripts/discodev.sh
RUN /scripts/discostable.sh

EXPOSE 22

# Run supervisord
CMD ["/usr/bin/supervisord"]
