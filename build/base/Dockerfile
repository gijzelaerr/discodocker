#FROM ubuntu
FROM gijzelaerr/trusty
MAINTAINER gijs@pythonic.nl
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y curl erlang-base git make python erlang-parsetools erlang-inets erlang-dev openssh-server supervisor

ADD scripts /scripts

# Add the supervisor configuration file
ADD conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# setup ssh
RUN echo root:ska | chpasswd
RUN mkdir -p /var/run/sshd

## passwordless login for localhost
RUN mkdir -p /root/.ssh
RUN ssh-keygen -N '' -f /root/.ssh/id_dsa
RUN cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys
RUN echo -n "localhost " > /root/.ssh/known_hosts
RUN cat /etc/ssh/ssh_host_rsa_key.pub >> /root/.ssh/known_hosts

## install disco
RUN /scripts/discostable.sh

