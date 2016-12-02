#!/bin/sh
chown -R named:named /etc/bind
/usr/sbin/named -c /etc/bind/named.conf -g -u named