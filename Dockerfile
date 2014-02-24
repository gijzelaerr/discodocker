FROM gijzelaerr/trusty
MAINTAINER gijs@pythonic.nl
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y erlang-base git make
RUN git clone git://github.com/discoproject/disco.git
RUN cd disco && make

#RUN apt-get install -y curl make erlang-base
#RUN curl -O -L https://github.com/discoproject/disco/archive/0.5.tar.gz -O
#RUN tar zxvf 0.5.tar.gz
#RUN cd disco-0.5 && make


