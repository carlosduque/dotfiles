#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import re

from bs4 import BeautifulSoup
import requests

MY_PLATES_LAST_NUM = 5

url = "http://www.uoct.cl/restriccion-vehicular/"
#url = "http://www.beastie.me/restrict.html"

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

def main():
    req = None
    try:
        print "[==>] 'GET' %s" % (url)
        req = requests.get(url)
        if req.status_code != 200:
            print "[!!!] Received: %s" % (req.status_code)
            sys.exit(-1)
        else:
            html = BeautifulSoup(req.text, "html.parser")
            #html.select(".preemergencia")
            #html.find_all(re.compile("^span"))
            alert_text = html.find("span", class_="preemergencia").text
            date = alert_text.split(":")[0]
            restricted = extract_greens(alert_text.split(":")[1])
            print "[***] Restrictions: %s" % (restricted)
    except requests.ConnectionError as rce:
        print "[!!!] Couldn't connect:%s:%s" % (rce.errno, rce.strerror)
    except requests.HTTPError as he:
        print "[!!!] HTTP error:%s:%s" % (he.errno, he.strerror)

    if MY_PLATES_LAST_NUM in restricted:
        print "You may leave, but your car has to stay home on %s" % (date)
main()
