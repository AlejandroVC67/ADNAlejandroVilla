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
            branches: [[name: '*/main']], 
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
    
    stage('Compile & Unit Tests') {
      steps{
        echo "------------>Unit Tests<------------"
        //sh "killall 'Simulator' 2&> /dev/null || true"
        //sh "xcrun simctl erase all"
         sh "xcodebuild -scheme ADNAlejandroVilla -enableCodeCoverage YES -configuration Debug -destination name=iPhone 11,OS=13.0 test | tee build/xcodebuild-test.log | xcpretty -r junit --output build/reports/junit.xml"
      }
    }

    stage('Static Code Analysis') {
      steps{
        echo '------------>Análisis de código estático<------------'
        /*withSonarQubeEnv('Sonar') {
            sh "${tool name: 'SonarScanner', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner -Dproject.settings=sonar-project.properties"
        }*/
      }
    }

    stage('Build') {
      steps {
        echo "------------>Build<------------"
         sh 'xcodebuild -scheme "ADNAlejandroVilla" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 11,OS=13.0" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'
      }
    }  
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

