pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
stage('Run Tests') {
    steps {
        script {
            sh 'docker build --target build -t zelda-frontend-test .'
            sh 'docker run --rm zelda-frontend-test bash -c "cd /frontend && CI=true npm test"'
             }
    }
}    
         
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -f ./Dockerfile -t zelda_frontend .'
                }
            }
        }
        
        // stage('Login to GHCR and Push Docker Image') {
        //     steps {
        //         script {
        //             withCredentials([string(credentialsId: 'ghcr-token', variable: 'GITHUB_TOKEN')]) {
        //                 sh 'echo $GITHUB_TOKEN | docker login ghcr.io -u le7-devops --password-stdin'
        //                 sh 'docker tag zelda_frontend ghcr.io/le7-devops/frontend:latest'
        //                 sh 'docker push ghcr.io/le7-devops/frontend:latest'
        //             }
        //         }
        //     }
        // }
        
        // stage('Push Version to Git') {
        //     steps {
        //         sshagent(['github']) {
        //             script {
        //                 sh 'git config user.email "sara.beck.dev@gmail.com"'
        //                 sh 'git config user.name "sara"'
        //                 sh 'git tag -a v$(date +"%Y%m%d%H%M%S") -m "Automated version update"'
        //                 sh 'git push --tags'
        //             }
        //         }
        //     }
        // }
    }
}