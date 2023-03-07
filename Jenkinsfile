pipeline {
    agent { label 'jenkins-node' }
    triggers {
      pollSCM '* * * * *'
    }
    parameters {
        string defaultValue: 'ubuntu', name: 'TOMCAT_USER'
        string defaultValue: '10.0.20.24', name: 'TOMCAT_IP'
        string defaultValue: '/var/lib/tomcat9/webapps', name: 'TOMCAT_WEPAPP_DIR'
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
            sh 'scp ${WORKSPACE}/target/hello-world.war ${params.TOMCAT_USER}@${params.TOMCAT_IP}:${params.TOMCAT_WEPAPP_DIR}'
        }
      }
    }
}

