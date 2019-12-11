#/bin/bash
echo "-----------DEPLOY IN EC2-------------"
echo "WE ARE HERE"
a=$(docker ps -a | grep "ted_search" | cut -d " " -f9)
if [ $a ] 
then
docker rm ted_search -f
echo "REMOOOOOOOOOOVED"
fi
echo "WE ARE HERE"
latest=$(aws ecr describe-images --repository-name ted_search --output text --query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[*]' | tr '\t' '\n' | sort -n | tail -1)
echo "HERE IS THE TAG"
echo $latest
docker pull 384842694817.dkr.ecr.us-east-2.amazonaws.com/ted_search:$latest
docker tag  384842694817.dkr.ecr.us-east-2.amazonaws.com/ted_search:$latest ted_search:latest
docker run -d --name ted_search -p 80:9191 ted_search:latest