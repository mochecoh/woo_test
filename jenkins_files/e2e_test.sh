#/bin/bash
a=$(docker ps -a | grep "ted_search" | cut -d " " -f9)
if [ $a ] 
then
    docker rm ted_search -f
    echo "------------------------- docker ted_search removed ---------------------"
fi

docker run -d -p 9191:9191 --name ted_search ted_image

hostip=$(/sbin/ip route|awk '/default/ { print $3 }')

if [ -d "venv" ]; then
  rm -rf venv
  echo "----------------- virtual environment removed ---------------------"
fi

virtualenv venv
. ./venv/bin/activate
pip install requests
pip install -U  pytest
/var/jenkins_home/.local/bin/pytest --ip=http://$hostip:9191
exit_of_pytest=$?
deactivate

if [ -d "venv" ]; then
  rm -rf venv
  echo "----------------- virtual environment removed ---------------------"
fi

a=$(docker ps -a | grep "ted_search" | cut -d " " -f9)
if [ $a ] 
then
    docker rm ted_search -f
    echo "------------------------- docker ted_search removed ---------------------"
fi

if [ ! $exit_of_pytest -eq 0 ] 
then
    exit 1
fi