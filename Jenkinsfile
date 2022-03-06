#!/usr/bin/env groovy

pipeline {
    agent  { dockerfile true }
    }

    stages {    
        stage('Image build  and publish') {
            steps {
                node {
                    checkout scm
                    def customImage = docker.build("my-flask-image:${env.BUILD_ID}")
                    customImage.inside {
                        sh 'flask run'
                    }
                    customImage.push()
                }
            }
        }
        
        stage('Deploy flask to Dcoekr') {
            steps {
                node {
                    checkout scm
                    docker.withServer('tcp://localhost:2376'){
                        docker.image('my-flask-image').withRun('-p 80')
                    }       
                }
            }
        }       
        
        stage('test') {
            steps {
                sh 'python test.py'
            }
            post {
                always {junit 'test-reports/*.xml'}
            }
        }
    }
}
