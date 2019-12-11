#/bin/bash
echo "-------------BUILD and publish to ECR-------------"
$(aws ecr get-login --no-include-email --region us-east-2)
docker tag myserver:latest 384842694817.dkr.ecr.us-west-2.amazonaws.com/myserver:latest
docker push 384842694817.dkr.ecr.us-west-2.amazonaws.com/myserver:latest
