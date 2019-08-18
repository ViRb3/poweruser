#!/bin/sh
#
# Remove APN proxies, must run as root
#

sed -ri 's/(\b(proxy|port))=".+"/\1=""/' apns-conf.xml
