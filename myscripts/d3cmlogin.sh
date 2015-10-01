#!/usr/bin/expect
spawn telnet 192.168.100.1
expect "login:"
send "msoadmin\r"
expect "Password:"
send "aDm1n\$TR8r\r"

interact

exit
