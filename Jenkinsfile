pipeline {
    agent any

    stages {

        stage('build'){
            steps { 
                sh 'docker build -t myserver .'
            }
        }
    
        stage('e2e test'){
            steps { 
                sh './jenkins_files/e2e_test.sh'
            }
        }

        stage('publish'){
            steps { 
                withAWS(credentials: 'aws_key', region: 'us-west-2') {
                    sh './jenkins_files/publish.sh'
                }
            }
        }

        stage('deploy'){
            steps { 
                sh 'echo a'
                //sh './jenkins_files/deploy.sh'
            }
        }
//release
    } 
}