#!/bin/bash
for i in {0..24}; do
	j=$(($i*25))
	echo **.user[$j].numUdpApps = 1
	echo **.user[$j].udpApp[0].typename = \"VoIPApp\"  
	echo **.user[$j].udpApp[0].destPort = 5000
	echo **.user[$j].udpApp[0].localPort = 5000
	echo **.user[$j].udpApp[0].messageLength = 32B + 40B #Data: 32B, Header: 40B = 20B(IP) + 8B(UDP) + 12B(RTP)
	echo **.user[$j].udpApp[0].sendInterval = 20ms # 1000ms / 20ms = 50 packets per second.
	echo **.user[$j].udpApp[0].acceptableDelay = 200ms 
	echo -n **.user[$j].udpApp[0].destAddresses = \" 
	for k in {0..24}; do
		l=$(($k*25))
		echo -n "user[$l] "
	done
	echo \"
done

echo ""

for i in {0..24}; do
	j=$(($i*25+1))
	echo "**.user[$j..$(($j+23))].numTcpApps = 1"
	echo "**.user[$j..$(($j+23))].tcpApp[0].typename = \"TCPBasicClientApp\""
	echo "**.user[$j..$(($j+23))].tcpApp[0].connectAddress = \"httpServer\"" 
	echo "**.user[$j..$(($j+23))].tcpApp[0].connectPort = 80"
	echo "**.user[$j..$(($j+23))].tcpApp[0].replyLength = exponential(150000B)"
	echo "**.user[$j..$(($j+23))].tcpApp[0].idleInterval = exponential(30s)"
	echo "**.user[$j..$(($j+23))].tcpApp[0].thinkTime = 0"
	echo "**.user[$j..$(($j+23))].tcpApp[0].dataTransferMode = \"object\""
	echo ""
done
