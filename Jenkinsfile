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

        stage('Build') {
            steps {
                script{
                    sh "cd docker-jenkins && make build"
                }

            }
        }

        stage('List Images') {
            steps {
                script {
                    sh "docker images"
                }
            }
        }

        stage('Cleanup') {
            steps {
                script{
                    sh "docker-compose down --rmi local"
                }
            }
        }

        stage('List Images') {
            steps {
                script {
                    sh "docker images"
                }
            }
        }
    }
}