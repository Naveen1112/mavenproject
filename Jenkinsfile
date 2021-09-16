node{
  environment{
    PATH = "/home/ec2-user/apache-maven-3.8.2/bin:$PATH"
  }
  stage('SCM Checkout'){
    git 'https://github.com/Naveen1112/SampleWebApplication'
  }
  stage('Compile-Package'){
    //Get Maven Home Path
    def mvnHome = tool name: 'maven-3', type: 'maven'
    //sh "${mvnHome}/bin/mvn compile"
    //sh "${mvnHome}/bin/mvn package"
    sh "${mvnHome}/bin/mvn clean install"
  }
  stage('Deploy to Tomcat'){
    sshagent(['tomcat_user']) {
      sh 'scp -o StrictHostKeyChecking=no target/SampleWebApplication.war ec2-user@ip-172-31-95-197.ec2.internal:/home/ec2-user/tomcat/apache-tomcat-8.5.71/webapps/'
    }
  }
}
