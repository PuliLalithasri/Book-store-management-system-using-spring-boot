pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/PuliLalithasri/Book-store-management-system-using-spring-boot.git'
            }
        }
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Build and Run with Docker') {
            steps {
                sh 'docker build -t book-store-app .'
                sh 'docker run -d -p 1001:1001 --name book-store-app book-store-app'
            }
        }
    }
}
