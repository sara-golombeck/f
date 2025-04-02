
pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                sshagent(['github']) {
                    sh 'rm -rf f'
                    sh 'git clone git@github.com:sara-golombeck/f.git'
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                    sh 'docker build -f Dockerfile.test -t zelda-frontend-test .'
                    // sh 'docker run --rm zelda-frontend-test'
                    sh 'docker run --rm -v $(pwd):/app -w /app node:8-alpine npm test -- --watchAll=false'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -f ./Dockerfile -t zelda_frontend .'
                }
            }
        }
        

        
        stage('Login to GHCR and Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'ghcr-token', variable: 'GITHUB_TOKEN')]) {
                        sh 'echo $GITHUB_TOKEN | docker login ghcr.io -u le7-devops --password-stdin'
                        sh 'docker tag zelda_frontend ghcr.io/le7-devops/frontend:latest'
                        sh 'docker push ghcr.io/le7-devops/frontend:latest'
                    }
                }
            }
        }
        
        stage('Push Version to Git') {
            steps {
                sshagent(['github']) {
                    script {
                        sh 'git config user.email "sara.beck.dev@gmail.com"'
                        sh 'git config user.name "sara"'
                        sh 'git tag -a v$(date +"%Y%m%d%H%M%S") -m "Automated version update"'
                        sh 'git push --tags'
                    }
                }
            }
        }
    
    }
}