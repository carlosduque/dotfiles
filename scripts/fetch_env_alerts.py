#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import re

from bs4 import BeautifulSoup
import requests

url = "http://www.uoct.cl/restriccion-vehicular/"
def extract_greens(text):
    seal_sections = text.split(",")
    greens = re.search(r'[0-9].*[0-9]$', seal_sections[1], flags = 0)
    green_restrictions = [int(num) for num in greens.group.split("-")]

def extract_date(text):
    text.split(":")[0]

def main():
    req = None
    try:
        req = requests.get(url)
        if req.status_code != 200:
            print "received: %s" % (req.status_code)
            sys.exit(-1)
        else:
            html = BeautifulSoup(req.txt, "html.parser")
            #html.select(".preemergencia")
            #html.find_all(re.compile("^span"))
            preemergency = html.find("span", class_="preemergencia").text
            date = preemergency.split(":")[0]
            restricted = extract_greens(preemergency.split(":")[1])
            print "restrictions: %s" % (restricted)
    except requests.ConnectionError as rce:
        print "couldn't connect:%s:%s" % (rce.errno, rce.strerror)

main()
