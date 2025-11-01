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
                    echo '🚧 Building Spring Boot project using Maven...'
                    sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Run Spring Boot App') {
            steps {
                dir('BOOk STORE MANAGEMENT SYSTEM/bookStore') {
                    echo '🚀 Running Spring Boot application...'
                    // Run in background so Jenkins doesn’t hang
                    sh 'nohup java -jar target/bookStore-0.0.1-SNAPSHOT.jar > app.log 2>&1 &'
sleep 20
sh 'curl -v http://localhost:1001 || true'

                }
            }
        }
    }

    post {
        success {
            echo '✅ Build and Spring Boot app started successfully!'
        }
        failure {
            echo '❌ Build failed. Check console output for details.'
        }
    }
}
