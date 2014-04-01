from disco.core import Job, result_iterator

import os
master = os.environ.get("DISCOMASTER_PORT_8989_TCP_ADDR", None)
if master:
    os.environ["DISCO_MASTER_HOST"] = master
    os.environ["DISCO_PROXY"] = master

print "master:", master

def map(line, params):
    for word in line.split():
        yield word, 1

def reduce(iter, params):
    from disco.util import kvgroup
    for word, counts in kvgroup(sorted(iter)):
        yield word, sum(counts)

if __name__ == '__main__':
    job = Job().run(input=["http://discoproject.org/media/text/chekhov.txt"],
                    map=map,
                    reduce=reduce,
                    master=master)
    for word, count in result_iterator(job.wait(show=True)):
        print(word, count)
