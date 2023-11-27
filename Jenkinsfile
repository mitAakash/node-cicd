pipeline {
    agent any
    stages {
        stage("Clone Code") {
            steps {
                echo "Cloning the code from Git"
                git url: "https://github.com/mitAakash/node-cicd.git", branch: "master"
            }
        }
        stage("Build and Test") {
            steps {
                echo "Building the Docker image of the code"
                sh "docker build . -t node-app-aakash"
            }
        }
        stage("Push image to DockerHub") {
            steps {
                echo "Pushing the image to DockerHub"
                script {
                    // Wrap the Docker login command inside the withCredentials block
                    withCredentials([usernamePassword(credentialsId: "dockerhub", passwordVariable: "dockerhubPass", usernameVariable: "dockerhubuser")]) {
                        sh "docker tag node-app-aakash ${env.dockerhubuser}/node-app-aakash:latest"
                        sh "docker login -u ${env.dockerhubuser} -p ${env.dockerhubPass}"
                        sh "docker push ${env.dockerhubuser}/node-app-aakash:latest "
                    }
                }
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploying the image"
                // Your deployment steps go here
            }
        }
    }
}
