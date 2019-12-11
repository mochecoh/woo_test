#/bin/bash
echo "-----------DEPLOY IN EC2-------------"

helm upgrade --install --wait myserver ./helm/helm-chart/myserver --namespace test