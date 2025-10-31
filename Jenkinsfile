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
                dir('BOOk STORE MANAGEMENT SYSTEM/bookStore') {  // 👈 change directory to where pom.xml exists
                    sh 'mvn clean package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('BOOk STORE MANAGEMENT SYSTEM/bookStore') {
                    sh 'docker build -t bookstore-app .'
                }
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 8080:8080 bookstore-app'
            }
        }
    }
}
