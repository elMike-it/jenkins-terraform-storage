pipeline {
    agent any
    environment {
        PROJECT_ID = 'test-interno-trendit'
        SERVICE_NAME = 'mike-cloud-run-service'
        REGION = 'us-central1' // e.g., us-central1
        IMAGE_NAME = "gcr.io/${PROJECT_ID}/${SERVICE_NAME}"
        GCP_KEYFILE = credentials('gcp-service-account-key') // Configurado en Jenkins
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Authenticate with GCP') {
            steps {
                script {
                withCredentials([file(credentialsId: 'gcp-terraform-service-account-key', variable: 'GOOGLE_TERRAFORM_APPLICATION_CREDENTIALS')]) {
                    // Activa la cuenta de servicio para gcloud
                    sh """
                    gcloud auth activate-service-account --key-file=$GOOGLE_TERRAFORM_APPLICATION_CREDENTIALS
                    gcloud config set project $PROJECT_ID
                    gcloud auth list
                    gcloud auth configure-docker us-central1-docker.pkg.dev
                    terraform -version
                    """
                     }
                }
            }
        }
        stage('Initialize Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }
        stage('Plan Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
    post {
        always {
            cleanWs() // Limpia el workspace después del pipeline
        }
    }
}
