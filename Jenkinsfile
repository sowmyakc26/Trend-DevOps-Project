pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "skc26/trend-app:latest"
        DOCKER_CREDS = "docker-hub-creds"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDS}", passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "docker build -t ${DOCKER_IMAGE} ."
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh "kubectl apply -f k8s-deploy.yaml"
                sh "kubectl rollout restart deployment/trend-app"
            }
        }
    }
}
