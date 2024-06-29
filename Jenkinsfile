pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh './build.sh'
            }
        }
        
        stage('Deploy') {
            environment {
                DOCKER_REGISTRY_CREDS = 'docker_capid' 
            }
            steps {
                // Using credentials to login to Docker Hub
                withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
                    sh './deploy.sh'
                }
            }
        }
    }
}
