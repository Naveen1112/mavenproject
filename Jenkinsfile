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
    sh 'docker build -t naveen1112/maventomcat:1.0 .'
  }
  stage ('Push Docker Image'){
    withCredentials([string(credentialsId: 'd6e09692-86f9-49f2-b447-4831a10fbd53', variable: 'DockerHubpwd')]) {
      sh "docker login -u naveen1112 -p ${DockerHubpwd}"
    }
    sh 'docker push naveen1112/maventomcat:1.0'
  }
  stage ('Run Docker image in Dev Environment'){
    def dockerRun = 'docker run -p 8080:8080 -d -name tomcatapp mav'entomcat:1.0'
    sshagent(['dev_user']) {
      sh "ssh -o StrictHostKeyChecking=no ec2-user@ip-172-31-25-100.ec2.internal ${dockerRun}"
    }
  } 
}
