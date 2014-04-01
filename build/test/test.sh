export DISCO_MASTER_HOST=${DISCOMASTER_PORT_8989_TCP_ADDR}
export DISCO_PROXY=${DISCOMASTER_PORT_8999_TCP_ADDR}
env
su -c "python /disco/examples/util/count_words.py" disco
