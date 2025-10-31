pipeline {
    agent any

    tools {
        jdk 'JDK 17'
        maven 'Maven'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/PuliLalithasri/Book-store-management-system-using-spring-boot.git'
            }
        }

        stage('Build with Maven') {
            steps {
                dir('BOOk STORE MANAGEMENT SYSTEM/bookStore') {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Build and Run with Docker Compose') {
            steps {
                sh 'docker-compose down || true'
                sh 'docker-compose build'
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        success {
            echo '✅ Build and deployment successful!'
        }
        failure {
            echo '❌ Build failed. Check logs above.'
        }
    }
}
