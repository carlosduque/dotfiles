#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import re

import requests
from bs4 import BeautifulSoup

def extract_greens(text):
    'Extract restricted plates with green seals'
    # from pudb import set_trace; set_trace()
    seals = text.split(",")
    greens = re.search(r'[0-9].*[0-9]$', seals[1], flags = 0)
    restrictions = [int(num) for num in greens.group().split("-")]
    return restrictions

def extract_date(text):
    'Extract the date that this restriction applies to'
    return text.split(":")[0]

def process(url = "http://www.uoct.cl/restriccion-vehicular/", plates_to_check = [5]):
    'find out if the certain license plates have restrictions'
    req = None
    try:
        print "[==>] 'GET' %s" % (url)
        req = requests.get(url)
        if req.status_code != 200:
            print "[<==] Received: %s" % (req.status_code)
            sys.exit(-1)
        else:
            html = BeautifulSoup(req.text, "html.parser")
            #html.select(".preemergencia")
            #html.find_all(re.compile("^span"))
            alert_text = html.find("span", class_="preemergencia").text
            date = alert_text.split(":")[0]
            all_restricted = extract_greens(alert_text.split(":")[1])
            print "[*] Restrictions for %s: %s" % (date, all_restricted)
    except requests.ConnectionError as rce:
        print "[!!] Couldn't connect:%s:%s" % (rce.errno, rce.strerror)
    except requests.HTTPError as he:
        print "[!!] HTTP error:%s:%s" % (he.errno, he.strerror)

    restricted = [plate for plate in plates_to_check if plate in all_restricted]
    return restricted

if __name__ == "__main__":
    #import pudb; pudb.set_trace()
    restricted = []
    if len(sys.argv) > 2:
        plates_to_check = [int(num) for num in sys.argv[2:]]
        restricted = process(sys.argv[1], plates_to_check)
    else:
        restricted = process()

    print "[*] From your list, these are restricted: %s" % (restricted)

