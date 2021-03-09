pipeline {
  //Donde se va a ejecutar el Pipeline
  agent {
    label 'Slave_Mac'
  }

  //Opciones específicas de Pipeline dentro del Pipeline
  options {
    	buildDiscarder(logRotator(numToKeepStr: '3'))
 	    disableConcurrentBuilds()
  }

  //Una sección que define las herramientas “preinstaladas” en Jenkins
  /*tools {
    jdk 'JDK8_Centos' //Preinstalada en la Configuración del Master
  }*/

  //Aquí comienzan los “items” del Pipeline
  stages{
    stage('Checkout') {
        steps{
            echo "------------>Checkout<------------"
            checkout([
            $class: 'GitSCM', 
            branches: [[name: '*/ManualDDDStructure']], 
            doGenerateSubmoduleConfigurations: false, 
            extensions: [], 
            gitTool: 'Default', 
            submoduleCfg: [], 
            userRemoteConfigs: [[
              credentialsId: 'Github_AlejandroVC67', 
              url:'https://github.com/AlejandroVC67/ADNAlejandroVilla'
              ]]
            ])
        }
    }
    
    stage('Build') {
      steps {
        echo "------------>Build<------------"
        sh 'xcodebuild -scheme "Domain" clean build CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED="NO"'
      }
    } 
    
    stage('Static Code Analysis') {
      steps{
        echo '------------>Análisis de código estático<------------'
        withSonarQubeEnv('Sonar') {
            sh "${tool name: 'SonarScanner', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner"
        }
      }
    }
    /*
    stage('Compile & Unit Tests') {
      steps{
        echo "------------>Unit Tests<------------"
        //sh "killall 'Simulator' 2&> /dev/null || true"
        //sh "xcrun simctl erase all"
         sh 'xcodebuild -scheme "ADNAlejandroVilla" -enableCodeCoverage YES -configuration build test -destination "platform=iOS,id=05e2c9f07d7f7df8c72ab78b594c681977407cc2" CODE_SIGNING_REQUIRED=NO | tee build/xcodebuild-test.log | xcpretty -r junit --output build/reports/junit.xml'
      }
    }
    */
  }

  post {
    always {
      echo 'This will always run'
    }
    success {
      echo 'This will run only if successful'
    }
    failure {
      echo 'This will run only if failed'
    }
    unstable {
      echo 'This will run only if the run was marked as unstable'
    }
    changed {
      echo 'This will run only if the state of the Pipeline has changed'
      echo 'For example, if the Pipeline was previously failing but is now successful'
    }
  }
}

