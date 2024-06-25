
pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS_ID = 'capstone_id' // Update with your credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository
                git branch: 'main', url: 'https://github.com/bharath11112001/capstone.git'
            }
        }

        stage('Build and Deploy') {
            steps {
                script {
                    // Get Docker Hub credentials
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_HUB_CREDENTIALS_ID}", passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                        // Log in to Docker Hub
                        sh "echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin"
                        // Run the deploy.sh script with Docker Hub username
                        sh """
                        export DOCKER_HUB_USERNAME=${DOCKER_HUB_USERNAME}
                        chmod +x deploy.sh
                        ./deploy.sh
                        """
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean workspace after build
            cleanWs()
        }
    }
}
