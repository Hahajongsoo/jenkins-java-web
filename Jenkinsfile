pipeline {
    agent { label 'jenkins-node' }
    triggers {
      pollSCM '* * * * *'
    }
    environment {
        TOMCAT_IP = '10.0.20.24'
    }
    stages {
      stage('Checkout') {
        steps {
          git branch: 'main', url: 'https://github.com/Hahajongsoo/jenkins-java-web.git'
        }
      }
    
      stage('Maven Build') {
        steps {
          sh 'mvn clean package'
        }
    
        tools {
          maven 'maven-3'
        }
      }

      stage('Deploy to Tomcat') {
        steps {
            sh 'scp ${WORKSPACE}/target/hello-world.war ubuntu@$TOMCAT_IP:/var/lib/tomcat9/webapps'
        }
      }
    }
}

