pipeline {
    agent {
        label 'docker-slave'
    }

    stages {

        stage('Checkout SCM'){
            steps {
                checkout scm
                script{
                    def commit = sh(
                        script: "git rev-parse HEAD",
                        returnStdout: true
                    ).trim()
                }
            }
        }

        stage('Build & Push Master') {
            steps {
                dir ("docker-jenkins/jenkins-master/") {
	                script {
	                    docker.withRegistry('https://index.docker.io/v1/', 'mikeder-dockerhub') {
	                        def image = docker.build("mikeder/jenkins-master")
		                    image.push("latest")
		                    image.push("${env.BRANCH_NAME}-${env.BUILD_ID}")
                            sh "docker rmi ${image.id}"
	                    }
	                }
                }
            }
        }

        stage('Build & Push Slave') {
            steps {
                dir ("docker-jenkins/jenkins-slave/") {
	                script {
                        docker.withRegistry('https://index.docker.io/v1/', 'mikeder-dockerhub') {
	                        def image = docker.build("mikeder/jenkins-slave")
		                    image.push("latest")
		                    image.push("${env.BRANCH_NAME}-${env.BUILD_ID}")
                            sh "docker rmi ${image.id}"
                        }
	                }
                }
            }
        }

        stage('Build & Push Data') {
            steps {
                dir ("docker-jenkins/jenkins-data/") {
	                script {
                        docker.withRegistry('https://index.docker.io/v1/', 'mikeder-dockerhub') {
		                    def image = docker.build("mikeder/jenkins-data")
		                    image.push("latest")
		                    image.push("${env.BRANCH_NAME}-${env.BUILD_ID}")
                            sh "docker rmi ${image.id}"
                        }
	                }
                }
            }
        }

        stage('Build & Push NGINX') {
            steps {
                dir ("docker-jenkins/jenkins-nginx/") {
	                script {
                        docker.withRegistry('https://index.docker.io/v1/', 'mikeder-dockerhub') {
		                    def image = docker.build("mikeder/jenkins-nginx")
		                    image.push("latest")
		                    image.push("${env.BRANCH_NAME}-${env.BUILD_ID}")
                            sh "docker rmi ${image.id}"
                        }
	                }
                }
            }
        }

        stage('List Images') {
            steps {
                script {
                    sh "docker images"
                    sh "df -h"
                }
            }
        }
    }
}