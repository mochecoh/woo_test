#/bin/bash
echo "-----------DEPLOY IN EC2-------------"

helm upgrade --install --wait geared-alpaca ./helm/helm-charts/myserver