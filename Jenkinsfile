node('docker-agent'){
  environment {
        def dockerTool = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
        docker = "${dockerTool}/bin"
    }
  stage('SCM Checkout'){
    git 'https://github.com/Naveen1112/mavenproject'
  }
  stage('Compile-Package'){
    //Get Maven Home Path
    def mvnHome = tool name: 'maven-3', type: 'maven'
    //sh "${mvnHome}/bin/mvn compile"
    //sh "${mvnHome}/bin/mvn package"
    sh "${mvnHome}/bin/mvn clean install"
  }
  stage('Docker Image Build'){
    sh 'docker build -t maventomcat:1.0 .'
  }
  stage ('Run Docker Container'){
      sh 'docker run -p 8080:8080 -d -name tomcatapp maventomcat:1.0'
  } 
}
