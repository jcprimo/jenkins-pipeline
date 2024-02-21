#Jenkinsfile
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages{
        stage("Create EKS Cluster"){
            steps {
                script {
                    # Location of terraform scripts
                    dir('terraform-for-cluster/')
                    sh "terraform init"
                    sh "terraform apply -auto-approve"
                }
            }
        }
        stage("Deploy to EKS"){
            steps {
                script {
                    dir('kubernetes/')
                    sh "aws eks update-kubeconfig --name jenkins-eks-cluster"
                    sh "kubectl apply -f development.yaml"
                    sh "kubectl apply -f service.yaml"
                }
            }
        }
    }
}