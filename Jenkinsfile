pipeline {
    agent {
        label 'docker-slave'
    }

    stages {

        stage('Checkout SCM'){
            steps {
                checkout scm
                script{
                    echo "# Building Commit #"
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
                    wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'xterm']) {
		                script {
	                        def image = docker.build("mikeder/jenkins-master")
		                    docker.withRegistry('https://index.docker.io/v1/', 'mikeder-dockerhub') {
			                    image.push("latest")
	                            sh "docker rmi ${image.id}"
		                    }
		                }
                    }
                }
            }
        }

        stage('Build & Push Slave') {
            steps {
                dir ("docker-jenkins/jenkins-slave/") {
                    wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'xterm']) {
		                script {
	                        def image = docker.build("mikeder/jenkins-slave")
	                        docker.withRegistry('https://index.docker.io/v1/', 'mikeder-dockerhub') {
			                    image.push("latest")
	                            sh "docker rmi ${image.id}"
	                        }
		                }
                    }
                }
            }
        }

        stage('Build & Push Data') {
            steps {
                dir ("docker-jenkins/jenkins-data/") {
                    wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'xterm']) {
		                script {
	                        def image = docker.build("mikeder/jenkins-slave")
	                        docker.withRegistry('https://index.docker.io/v1/', 'mikeder-dockerhub') {
			                    image.push("latest")
	                            sh "docker rmi ${image.id}"
	                        }
		                }
                    }
                }
            }
        }

        stage('Build & Push NGINX') {
            steps {
                dir ("docker-jenkins/jenkins-nginx/") {
                    wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'xterm']) {
		                script {
	                        def image = docker.build("mikeder/jenkins-nginx")
	                        docker.withRegistry('https://index.docker.io/v1/', 'mikeder-dockerhub') {
			                    image.push("latest")
	                            sh "docker rmi ${image.id}"
	                        }
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