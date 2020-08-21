#!/bin/bash

if [ "$1" == "" ] ; then
	echo "to show usage mode use ./ipscan -h "
exit
fi

echo "##################################################################################"
echo "                                welcome to my ipscan                             "
echo "##################################################################################"


if [ "$1" == "-h" ] ; then
	echo "Usage mode: ./ipscan [ARGUMENTS...]  <ip array to scan>"
	echo "-i to simple scan"
	echo "-io to gen file output"
	echo "-ic to clean scan"
	echo "-ioc to scan with clean output file"
	echo "Example:"
	echo "./ipscan -i 10.10.10 =====>> For simple scan."
	echo "./ipscan -io 10.10.10 =====>> For scan with output file."
	echo "./ipscan -ic 10.10.10  =====>> For clean scan [to clean output]."
	echo "./ipscan -ioc 10.10.10  =====>> For clean output scan [to clean output file type wordlist] "
fi
if [ "$1" == "-id" ] ; then
	for se in $(seq 1 254)
	do
		echo "==============<<V>>============="
		ping  $2.$se -c 2 | grep "icmp_seq=1 ttl" | cut -d " " -f 4 | sed 's/.$/ <<==Host is Up!/'
	done
echo "################################ ping scan ended #################################"
fi

if [ "$1" == "-ic" ] ; then   
        for se in $(seq 1 254)
        do
		ping  $2.$se -c 2 | grep "icmp_seq=1 ttl" | cut -d " " -f 4 | sed 's/.$/ /'
        done
echo "################################ ping scan ended #################################"
fi

if [ "$1" == "-ioc" ] ; then
	touch scanout.txt
	touch scanout-clean.txt
	for se in $(seq 1 10)
	do
		ping  $2.$se -c 2 >> scanout.txt
		echo "Testing "$2"."$se" | "$se" of 254"
	done
echo "################################ The hots Up is ###################################"
	grep "icmp_seq=1 ttl" $(pwd)/scanout.txt | cut -d " " -f 4 | sed 's/.$/ /'
	grep "icmp_seq=1 ttl" $(pwd)/scanout.txt | cut -d " " -f 4 | sed 's/.$/ /' >> scanout-clean.txt
echo "################################ ping scan ended ##################################"
fi




