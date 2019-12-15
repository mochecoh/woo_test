
# Summary #

This exercise comes to test your ability to create all the basic resources we are using in our company
this also serves as a way for us to view the way you interact with us and the team

The application you will need to compile and run is a GO application - We chose this since it's a simple enough example but still includes
elements that you might need to do some research to manage to work with but there is ample documentation for you to use.



# Exercise #

### Part 1: Understand the code and dockerize it 20 minutes

 * I never used go, but the code is pretty simple.
 * The Docker image is actually heavy, but i didnt want to loose time on 

### Part 2: Deploy Jenkins via terraform (fully automated) 3 h

 * The fully automated part wasnt nessecary and i did loose a lot of time on it, but it works finally
 * I used the Dockerized Jenkins, who already have Docker inside. 
 * Many "bugs" came up in the provisionning, and the jenkins plugins server was down most of the time

### Part 3 Deploy an EKS via Terraform 20 minutes

 * The main code is from AWS https://github.com/terraform-providers/terraform-provider-aws

### Part 4 Make a pipeline who push to ECR 45 min

 * Problems of Credentials with Aws came up 

### Part 5 Deploy The helm Chart to EKS 45 min

 * The Chart is in helm/helm-chart/myserver
 * I use a nginx ingress

### Part 6 Install kubectl and helm in Jenkins and make the deploy from there 2 h

 * The installation script of helm didnt worked on Jenkins, i try many of them, until i decide to modify one of them


Link of the app: http://a566ac6371c2e11eaae8c02386108a07-269203944.us-west-2.elb.amazonaws.com/
Link of the Github: https://github.com/mochecoh/woo_test
