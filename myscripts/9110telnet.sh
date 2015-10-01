#!/usr/bin/expect
set dutip [lindex $argv 0]

if { "$dutip" == "" } {
    set dutip "172.23.4.18"
}

spawn telnet $dutip
expect "User:"
send "admin\r"
expect "Password:"
send "admin\r"
expect "ESP-9110-SDN> "
send "enable\r"
expect "Password:"
send "1234\r"
expect "ESP-9110-SDN# "
send "dev sh\r"
expect "sh-3.2# "
send "bash\r"

interact

exit
