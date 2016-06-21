#!/bin/bash

ssh_cmd="ssh -NR 12481:localhost:22 -p 443 bthomastsai.ddns.net"
retry=1

while [ "$retry" -le 1555 ];
do
    timestamp=`date +%Y_%m_%d_%H`
    ps aux | grep ssh | grep "12481"
    if [ $? == 0 ]; then
        echo "=== Tunnel had been established on $timestamp ===\n"
        exit 0
    fi

    # Try to establish ssh tunnel
    echo "== run command ${ssh_cmd} on $timestamp ==\n"
    ${ssh_cmd}
    let "retry += 1"
    number=$[ ( $RANDOM % 500 )  + 1 ]

    echo " Sleep $number seconds to restart the connection \n "
    sleep $number
done

# Failed to establish tunnel
timestamp2=`date +%Y_%m_%d_%H`
echo " !!! SSH tunnel server is down $timestamp2 !!! \n"

exit 0
