
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

### Part 4 Make a pipeline who push to ECR 40 min

 * Problems of Credentials with Aws came up 

### Part 5 Deploy The helm Chart to EKS

 * the code you will need to compile is in app/server.go file
 * you can use any compiler you choose for this example

### Part 6 install kubectl in Jenkins and make the deploy from there

 * the code you will need to compile is in app/server.go file
 * you can use any compiler you choose for this example

* Create a source project repository for this exercise.
* Create a README for the source project, which includes some of the following information:
    * A summary of the exercise as executed.
    * Any important details (tools utilized, OSS component dependencies, etc.) in support of the exercise.
    * URLs or sources of information used to create your work.
    * Any other information you think is pertinent.
* All best practices for source control should be utilized.

### Create application and cloud resource orchestration deployment processes to deploy the provided Go application ###

* The application must be deployed fully via an automated process.
* Include details as to how you believe this process would be triggered in your source project README.

### Install Jenkins on an ec2 machine

  * Deploy the ec2 instance using Terraform
  * you may install Jenkins manually or use any automation tool you feel comforatble with
  * Install the required plugins as necessary

### Create a docker container to wrap the built binary and run it

 * Create a Jenkins pipeline to compile and build the binary and docker container
 * Push the docker container into an ECR

### Create a terraform which will install eks cluster with 1 node

### Create a helm chart to deploy new container 

### modify pipeline to deploy the new container using the previous helm chart

### Provide functional FQDN/endpoint for review ###

* This application should be accessible via the public internet.

## Completing Task ##

* Provide a link to your source project repository.
