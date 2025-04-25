pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        // stage('Run Tests') {
        //     steps {
        //         sh 'docker build --target build -t zelda-frontend-test .'
        //         sh 'docker run --rm -e NODE_ENV=test zelda-frontend-test npm run test -- --watchAll=false --ci'

        //     }
        // }          
    
stage('Run Tests') {
    steps {
        script {
            // שימוש ב-shell script קטן שיוצר סביבת git ורץ בדיקות
            sh '''
                # קודם בנה את התמונה
                docker build --target build -t zelda-frontend-test .
                
                # הרץ את הבדיקות עם שלב ביניים שיוצר repo git
                docker run --rm -e NODE_ENV=test -e CI=true zelda-frontend-test sh -c "
                    git init && 
                    git config --global user.email 'test@example.com' && 
                    git config --global user.name 'Test User' && 
                    git add . && 
                    git commit -m 'Initial commit' && 
                    npm test -- --watchAll=false --no-watchman --ci --testPathIgnorePatterns=frontend/src/,f/src/"
                "
            '''
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