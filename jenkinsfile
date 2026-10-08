pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'smscjp28@gmail.com', url: 'https://github.com/JavaCode2Code/devops-automation.git']])
                bat 'mvn clean install'
            }
        }
         stage('Build Docker Image') {
            steps {
                // On Windows, use bat instead of sh
                bat 'docker build -t sateesh1390/devops-automation:latest .'
            }
        }
        stage('Push to DockerHub'){
            steps{
               withCredentials([string(credentialsId: 'sateesh1390', variable: 'dockerhubpwd')]) {
               bat  """
                        docker login -u sateesh1390 -p ${dockerhubpwd}
                        docker tag devops-automation:latest sateesh1390/devops-automation:latest
                        docker push sateesh1390/devops-automation:latest
                    """
               }
            }
        }
    }
}