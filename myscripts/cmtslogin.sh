#!/usr/bin/expect
set cmtsip [lindex $argv 0]

if { "$cmtsip" == "" } {
    set cmtsip "10.1.2.119"
}

spawn telnet $cmtsip
expect "mCMTS login:"
send "hitron\r"
expect "Password:"
send "hitron\r"
expect "Router> "
send "enable\r"
expect "Password:"
send "hitron\r"
expect "Router# "
send "configure terminal\r"
interact

exit
