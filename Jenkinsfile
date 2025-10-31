pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'book-store-app'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/PuliLalithasri/Book-store-management-system-using-spring-boot.git'
            }
        }

        stage('Build with Maven') {
            steps {
                dir('BOOk STORE MANAGEMENT SYSTEM/bookStore') {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Build and Run with Docker') {
            steps {
                dir('BOOk STORE MANAGEMENT SYSTEM/bookStore') {
                    sh 'docker build -t ${DOCKER_IMAGE} -f Dockerfile . || true'
                    sh 'docker rm -f ${DOCKER_IMAGE} || true'
                    sh 'docker run -d -p 1001:1001 --name ${DOCKER_IMAGE} ${DOCKER_IMAGE}'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build and container run successful!'
        }
        failure {
            echo '❌ Build failed. Check logs above.'
        }
    }
}
