#/bin/bash
a=$(docker ps -a | grep "myserver" | cut -d " " -f9)
if [ $a ] 
then
    docker rm myserver -f
    echo "------------------------- docker ted_search removed ---------------------"
fi

docker run -d -p 8056:8080 --name myserver myserver

hostip=$(/sbin/ip route|awk '/default/ { print $3 }')

sleep 20

a=$(docker ps -a | grep "ted_search" | cut -d " " -f9)
if [ $a ] 
then
    docker rm myserver -f
    echo "------------------------- docker ted_search removed ---------------------"
fi
