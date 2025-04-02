// // // pipeline {
// // //     agent any
    
// // //     stages {
// // //         stage('Clone Repository') {
// // //             steps {
// // //                 sshagent(['github']) {
// // //                     sh 'rm -rf frontend'
// // //                     sh 'git clone git@github.com:le7-devops/frontend.git'
// // //                 }
// // //             }
// // //         }
        
// // //         stage('Build Docker Image') {
// // //             steps {
// // //                 script {
// // //                     sh 'docker build -f ./Dockerfile -t zelda_frontend .'
// // //                 }
// // //             }
// // //         }
        
// // //         stage('Login to GHCR and Push Docker Image') {
// // //             steps {
// // //                 script {
// // //                     withCredentials([string(credentialsId: 'ghcr-token', variable: 'GITHUB_TOKEN')]) {
// // //                         sh 'echo $GITHUB_TOKEN | docker login ghcr.io -u le7-devops --password-stdin'
// // //                         sh 'docker tag zelda_frontend ghcr.io/le7-devops/frontend:latest'
// // //                         sh 'docker push ghcr.io/le7-devops/frontend:latest'
// // //                     }
// // //                 }
// // //             }
// // //         }
        
// // //         stage('Push Version to Git') {
// // //             steps {
// // //                 sshagent(['github']) {
// // //                     script {
// // //                         sh 'git config user.email "sara.beck.dev@gmail.com"'
// // //                         sh 'git config user.name "sara"'
// // //                         sh 'git tag -a v$(date +"%Y%m%d%H%M%S") -m "Automated version update"'
// // //                         sh 'git push --tags'
// // //                     }
// // //                 }
// // //             }
// // //         }
// // //     }
// // // }

// // pipeline {
// //     agent any
    
// //     stages {
// //         stage('Clone Repository') {
// //             steps {
// //                 sshagent(['github']) {
// //                     sh 'rm -rf frontend'
// //                     sh 'git clone git@github.com:le7-devops/frontend.git'
// //                 }
// //             }
// //         }
        
// //         stage('Install Dependencies') {
// //             steps {
// //                 dir('frontend') {
// //                     sh 'npm install'
// //                 }
// //             }
// //         }
        
// //         stage('Run Unit Tests') {
// //             steps {
// //                 dir('frontend') {
// //                     sh 'npm test -- --watchAll=false'
// //                 }
// //             }
// //             post {
// //                 always {
// //                     junit 'frontend/junit.xml'
// //                 }
// //             }
// //         }
        
// //         stage('Build Docker Image') {
// //             steps {
// //                 script {
// //                     sh 'docker build -f ./Dockerfile -t zelda_frontend .'
// //                 }
// //             }
// //         }
        
// //         stage('Login to GHCR and Push Docker Image') {
// //             steps {
// //                 script {
// //                     withCredentials([string(credentialsId: 'ghcr-token', variable: 'GITHUB_TOKEN')]) {
// //                         sh 'echo $GITHUB_TOKEN | docker login ghcr.io -u le7-devops --password-stdin'
// //                         sh 'docker tag zelda_frontend ghcr.io/le7-devops/frontend:latest'
// //                         sh 'docker push ghcr.io/le7-devops/frontend:latest'
// //                     }
// //                 }
// //             }
// //         }
        
// //         stage('Push Version to Git') {
// //             steps {
// //                 sshagent(['github']) {
// //                     script {
// //                         sh 'git config user.email "sara.beck.dev@gmail.com"'
// //                         sh 'git config user.name "sara"'
// //                         sh 'git tag -a v$(date +"%Y%m%d%H%M%S") -m "Automated version update"'
// //                         sh 'git push --tags'
// //                     }
// //                 }
// //             }
// //         }
// //     }
// // }


// pipeline {
//     agent any
    
//     stages {
//         stage('Clone Repository') {
//             steps {
//                 sshagent(['github']) {
//                     sh 'rm -rf frontend'
//                     sh 'git clone git@github.com:sara-golombeck/f.git'
//                 }
//             }
//         }
        
//         stage('Run Tests') {
//             steps {
//                 dir('frontend') {
//                     sh 'npm install'
//                     sh 'npm test -- --watchAll=false'
//                 }
//             }
//         }
        
//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     sh 'docker build -f ./Dockerfile -t zelda_frontend .'
//                 }
//             }
//         }
        
//         stage('Login to GHCR and Push Docker Image') {
//             steps {
//                 script {
//                     withCredentials([string(credentialsId: 'ghcr-token', variable: 'GITHUB_TOKEN')]) {
//                         sh 'echo $GITHUB_TOKEN | docker login ghcr.io -u le7-devops --password-stdin'
//                         sh 'docker tag zelda_frontend ghcr.io/le7-devops/frontend:latest'
//                         sh 'docker push ghcr.io/le7-devops/frontend:latest'
//                     }
//                 }
//             }
//         }
        
//         stage('Push Version to Git') {
//             steps {
//                 sshagent(['github']) {
//                     script {
//                         sh 'git config user.email "sara.beck.dev@gmail.com"'
//                         sh 'git config user.name "sara"'
//                         sh 'git tag -a v$(date +"%Y%m%d%H%M%S") -m "Automated version update"'
//                         sh 'git push --tags'
//                     }
//                 }
//             }
//         }
//     }
    
//     post {
//         always {
//             junit allowEmptyResults: true, testResults: 'frontend/junit.xml'
//         }
//     }
// }
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
//                 dir('f') {  // או 'f' אם זה הנתיב הנכון
//                     // יצירת הדוקרפייל לבדיקות אם לא קיים
//                     sh '''
//                     cat > Dockerfile.test << 'EOL'
// FROM node:14-alpine

// WORKDIR /app

// # העתק קבצי package.json ו-package-lock.json תחילה
// COPY package*.json ./

// # התקן תלויות
// RUN npm install

// # העתק את שאר קוד המקור
// COPY . .

// # הרץ את הבדיקות
// CMD ["npm", "test", "--", "--watchAll=false"]
// EOL
//                     '''
                    
                    // בנה ותריץ את קונטיינר הבדיקות
                    sh 'pwd &&ls -al {WORKSPACE}/f'
                    sh 'docker build -f Dockerfile.test -t zelda-frontend-test .'
                    sh 'docker run --rm zelda-frontend-test'
                // }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -f ./Dockerfile -t zelda_frontend .'
                }
            }
        }
        
        // שאר השלבים...
    }
}