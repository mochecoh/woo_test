#/bin/bash
a=$(docker ps -a | grep "myserver" | cut -d " " -f9)
if [ $a ] 
then
    docker rm myserver -f
    echo "------------------------- docker ted_search removed ---------------------"
fi

docker run -d -p 8080:8080 --name myserver ted_image

hostip=$(/sbin/ip route|awk '/default/ { print $3 }')

sleep 5

a=$(docker ps -a | grep "ted_search" | cut -d " " -f9)
if [ $a ] 
then
    docker rm myserver -f
    echo "------------------------- docker ted_search removed ---------------------"
fi
