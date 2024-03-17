pipeline{
  agent any
  tools{
        maven 'MAVEN3'
    }
    stages{
        stage('Checkout & Build Maven Project') {
            steps{
                checkout scm
                sh 'mvn clean install'
            }
        }
        stage('Code Coverage (JaCoCo)') {
            steps {
                sh 'mvn jacoco:prepare-agent test jacoco:report'
            }
        }
        stage('Docker Build') {
            steps{
                script{
                    sh 'docker build -t tariquejemison/lab3-maven-webapp01 .'
                }
            }
        }
        stage('Docker Login'){
            steps{
                script{

                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login --username ${USERNAME} --password ${PASSWORD}'
                    }
                }
            }
  		}
  		stage('Docker Push'){
            steps{
                script{

                    sh 'docker push tariquejemison/lab3-maven-webapp01:latest'
                }
            }
  		}
	}
}