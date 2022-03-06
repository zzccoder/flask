#!/usr/bin/env groovy

pipeline {
    environment{
        IMAGE_TAG =  sh(returnStdout: true,script: 'echo $image_tag').trim()
        ORIGIN_REPO =  sh(returnStdout: true,script: 'echo $origin_repo').trim()
        REPO =  sh(returnStdout: true,script: 'echo $repo').trim()
        // gitlab revision用于滚动更新镜像
        REVISION =  sh(returnStdout: true,script: 'echo $revision').trim()
        PROJECT_NAME = sh(returnStdout: true,script: 'echo $project_name').trim()
      }
    agent { 
        node {
            label 'flask-pipeline'
        }
    }


    stages {
        stage('Image build  and publish') {
            steps {
                container("docker image"){
                sh "docker build  -f `pwd`/Dockerfile -"
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
