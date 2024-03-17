pipeline{
  agent any
  tools{
        maven 'MAVEN3'
    }
    stages{
        stage('Checkout & Build Maven Project') {
            steps{
                git branch: 'main', url: 'https://github.com/TariqueJemison01/MavenWebApp.git'
                bat 'mvn clean install'
            }
        }
        stage('Code Coverage (JaCoCo)') {
            steps {
                bat 'mvn jacoco:prepare-agent test jacoco:report'
            }
        }
        stage('Docker Build') {
            steps{
                script{
                    bat 'docker build -t tariquejemison/lab3-maven-webapp01 .'
                }
            }
        }
        stage('Docker Login'){
            steps{
                script{

                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    bat 'docker login --username ${USERNAME} --password ${PASSWORD}'
                    }
                }
            }
  		}
  		stage('Docker Push'){
            steps{
                script{

                    bat 'docker push tariquejemison/lab3-maven-webapp01:latest'
                }
            }
  		}
	}
}