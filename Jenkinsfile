#!/usr/bin/env groovy

pipeline {
    agent { 
        node {
            label 'flask-pipeline'
        }
    }


    stages {
        stage('My flash image build  and publish') {
            steps {
                container("docker image"){
                sh "docker login --username "zzcdockershiping" --password="0fbb6e33-fe53-44c7-962b-30a5a9a832ae" "
                sh "docker build  -f `pwd`/Dockerfile -t "zzcdockershiping/myflash" "
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
