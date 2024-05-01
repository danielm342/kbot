pipeline {
    agent any
    parameters {
        choice(name: 'OS', choices: ['linux', 'darwin', 'windows', 'all'], description: 'Pick OS')
        choice(name: 'ARCH', choices: ['amd64', 'arm64', 'x86'], description: 'Pick Arch')
    }
    stages {
        stage('Example') {
            steps {
                echo "Build for platform ${params.OS}"

                echo "Build for arch: ${params.ARCH}"

            }
        }
        
        ('clone') {
            steps {
                echo 'cone repository'
                git branch: "${BRANCH}", url : "${REPO}"
            }
        }

        stage('test') {
            steps {
                echo "start testing"
                sh 'make test'
            }
        }

        stage('build') {
            steps {
                echo "build app"
                sh 'make build'
            }
        }
        stage('image') {
             steps {
                echo "build docker image"
                sh 'make image'
             }
        }

        stage('push') {
              steps {
                echo 'push to registry'
                script {
                    docker.withRegistry('', 'dockerHub') {
                          sh 'make push'
                      }
                }
              }
        }
    }
}
