#!/bin/bash
cd /root/ofdpa
./client_group --groupid=0x0001000e
./client_group --groupid=0x0001000e --l2intfbktid=0 --outport=14 --popvlan=0
./client_group --groupid=0x0002000e
./client_group --groupid=0x0002000e --l2intfbktid=0 --outport=14 --popvlan=0

