FROM ubuntu
#FROM gijzelaerr/trusty
MAINTAINER gijs@pythonic.nl
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y curl erlang-base git make python erlang-parsetools erlang-inets erlang-dev openssh-server supervisor

ADD scripts /scripts

# setup ssh
RUN echo root:ska | chpasswd
RUN mkdir -p /var/run/sshd

## passwordless login for root
RUN mkdir -p /root/.ssh
RUN ssh-keygen -N '' -f /root/.ssh/id_dsa
RUN cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys
RUN echo -n "localhost " > /root/.ssh/known_hosts
RUN cat /etc/ssh/ssh_host_rsa_key.pub >> /root/.ssh/known_hosts

## passwordless login for disco
RUN adduser --system disco --shell /bin/sh
RUN mkdir -p /home/disco/.ssh
RUN ssh-keygen -N '' -f /home/disco/.ssh/id_dsa
RUN cat /home/disco/.ssh/id_dsa.pub >> /home/disco/.ssh/authorized_keys
RUN echo -n "localhost " > /home/disco/.ssh/known_hosts
RUN cat /etc/ssh/ssh_host_rsa_key.pub >> /home/disco/.ssh/known_hosts
RUN chown disco -R /home/disco/.ssh

## install disco
RUN /scripts/discostable.sh
RUN chown -R disco /usr/local/var/disco

