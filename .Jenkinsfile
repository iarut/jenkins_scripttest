pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Клонируем репозиторий
                checkout scm
            }
        }
        stage('Build') {
            steps {
//                  Запускаем сборку Gradle (предполагается, что используется оболочка Gradle Wrapper)
                 sh 'chmod +x gradlew'
                sh './gradlew clean build'
             }
        }   
        stage('Maven Install') {
               agent {         
                docker {          
                  image 'maven:3.5.0'         
              }       
           }       
           steps {
                sh 'mvn clean install'
                }
              }
        }
    }
}