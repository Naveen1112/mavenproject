node{
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
  stage('Deploy to Tomcat'){
    sshagent(['tomcat_user']) {
      sh 'scp -o StrictHostKeyChecking=no target/mavenproject.war nikitha_gundla16@10.182.0.2:/home/nikitha_gundla16/tomcat/apache-tomcat-8.5.71/webapps'
    }
  }
}
