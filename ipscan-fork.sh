#!/bin/bash

# In this version a want make a new method to arguments work,
# And I will start to develop it in the next commits
# For now this file do not have unlikeness on code or functions than main file 

if [ "$1" == "" ] ; then
	echo 'to show usage mode use "./ipscan -h"  or ./ipscan.sh --help'
exit
fi

echo "##################################################################################"
echo "                       welcome to my ipscan-fork-version                          "
echo "##################################################################################"
echo ""

if [ "$1" == "-h" ] || [ "$1" == "--help" ] ; then
	echo "Usage mode: ./ipscan [ARGUMENTS...]  [Ip Range to Scan]"
	echo "-i to simple scan"
	echo "-i -o to gen file output"
	echo "-i -c to clean scan"
	echo "-i -o -c to scan with clean output file"
	echo "Example:"
	echo "./ipscan -i 10.10.10.1/24 =====>> For simple scan."
	echo "./ipscan -i -o 10.10.10.1/24 =====>> For scan with output file."
	echo "./ipscan -i -c 10.10.10.1/24  =====>> For clean scan [to clean output]."
	echo "./ipscan -i -c -o 10.10.10.1/24  =====>> For clean output scan [to clean output file like wordlist] "
fi

if [ "$1" == "-i" ] ; then
	for se in $(seq 1 254)
	do
		ip=$(echo $2 | sed 's/....$//')
		echo "==============<<V>>============="
		ping  $ip$se -c 2 | grep "icmp_seq=1 ttl" | cut -d " " -f 4 | sed 's/.$/ <<==Host is Up!/'
	done
echo ""
echo "################################ ping scan ended #################################"
fi

if [ "$1" == "-ic" ] || [ "$1" == "-ci" ] ; then
        for se in $(seq 1 254)
        do
                ip=$(echo $2 | sed 's/....$//')
		ping  $ip$se -c 2 | grep "icmp_seq=1 ttl" | cut -d " " -f 4 | sed 's/.$/ /'
        done
echo ""
echo "################################ ping scan ended #################################"
fi

if [ "$1" == "-io" ] || [ "$1" == "-oi" ] ; then
        touch scanout.txt
        for se in $(seq 1 254)
        do
                ip=$(echo $2 | sed 's/....$//')
		echo "===============<<V>>=============="
                ping  $ip$se -c 2 >> scanout.txt
                echo "Testing "$ip$se" | "$se" of 254"
        done
echo ""
echo "################################ The hots Up is ###################################"
        grep "icmp_seq=1 ttl" $(pwd)/scanout.txt | cut -d " " -f 4 | sed 's/.$/ <<==Host is Up!/'
echo "################################ ping scan ended ##################################"
fi

if [ "$1" == "-ico" ] || [ "$1" == "-ioc" ] || [ "$1" == "-cio" ] || [ "$1" == "-coi" ] || [ "$1" == "-oci" ] || [ "$1" == "-oic" ] ; then
	touch scanout.txt
	touch scanout-clean.txt
	for se in $(seq 1 254)
	do
                ip=$(echo $2 | sed 's/....$//')
		ping  $ip$se -c 2 >> scanout.txt
		echo "Testing "$ip$se" | "$se" of 254"
	done
echo ""
echo "################################ The hots Up is ###################################"
	grep "icmp_seq=1 ttl" $(pwd)/scanout.txt | cut -d " " -f 4 | sed 's/.$/ /'
	grep "icmp_seq=1 ttl" $(pwd)/scanout.txt | cut -d " " -f 4 | sed 's/.$/ /' >> scanout-clean.txt
echo "################################ ping scan ended ##################################"
fi

if [ $* == "hey" ] ; then 

echo "Hey You!"
fi
