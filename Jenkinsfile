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
        stage('Deploy flash to Dcoekr') {
            steps {
                container('Dcoker') {
                    step(echo '')
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
