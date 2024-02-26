pipeline {
    agent any
    tools {
        maven 'MAVEN3' // Replace 'MAVEN' with your Maven installation name in Jenkins
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
