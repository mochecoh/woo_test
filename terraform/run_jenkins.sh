#!/bin/bash

sudo docker build -t myjenkins ~/ ;

sudo docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v jenkins-data:/var/jenkins_home --name jenkins -p 8080:8080 myjenkins;
