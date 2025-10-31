pipeline {
    agent any

    tools {
        maven 'Maven' // Use Maven installed in Jenkins
        jdk 'JDK17'   // Use JDK 17 (or whatever version you configured)
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/PuliLalithasri/Book-store-management-system-using-spring-boot.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('bookstore-app')
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker run -d -p 8081:8080 --name bookstore bookstore-app'
                }
            }
        }
    }
}
