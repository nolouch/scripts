#!/usr/bin/env python2
# coding=utf-8

import subprocess
import re
from threading import Thread

HOSTS_FILE = "hosts"

def get_hosts():
    with open(HOSTS_FILE, "r") as r:
        return r.read()

def ping(host, f):
    try:
        result = subprocess.check_output(['ping', '-c 600', host])
        lost_re = re.compile(r'(\d{1,3})% packet loss')
        lost_result = lost_re.search(result)
        f.write("server %s package loss: %s %%\n" % (host, lost_result.group(1)))
    except subprocess.CalledProcessError, er:
        f.write("server %s is cannot reach\n" % host)


def main():
    hosts_str = get_hosts()
    hosts = [host for host in hosts_str.split('\n') if host != '']
    threads = []
    f = open("result.out", "w+")
    for host in hosts:
        thread = Thread(target=ping, args=(host,f,))
        thread.start()
        threads.append(thread)

    for thread in threads:
        thread.join()

if __name__ == '__main__':
    main()




