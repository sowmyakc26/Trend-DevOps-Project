Trend React Application - DevOps Deployment Project
This repository contains the production-ready deployment of the Trend React Application. The project demonstrates a full CI/CD lifecycle using Terraform for Infrastructure as Code (IaC), Jenkins for automation, Docker for containerization, and AWS EKS for orchestration.
Live Application
LoadBalancer URL:  a6410b016dcb3450591a6947ce8ec5cb-1156249927.us-east-1.elb.amazonaws.com

Project Architecture
Infrastructure: Provisioned VPC, Subnets, IAM Roles, and an EKS Cluster using Terraform.
CI/CD Pipeline: Managed by Jenkins (hosted on EC2) with GitHub Webhook integration.
Containerization: Application is packaged into a Docker image using Nginx and pushed to DockerHub.
Orchestration: Deployed on Amazon EKS with high availability.

Repository Structure
dist/: Production-ready static build files.
Dockerfile: Configuration to serve the app via Nginx.
Jenkinsfile: Declarative pipeline for Build, Push, and Deploy stages.
main.tf: Terraform configuration for AWS infrastructure.
k8s-deploy.yaml: Kubernetes Deployment and Service manifests.

Setup Instructions
1. Infrastructure Setup
bash
terraform init
terraform plan
terraform apply --auto-approve

Jenkins Configuration
Installed Plugins: Docker Pipeline, Kubernetes CLI, GitHub Integration.
Credentials Added:
docker-hub-creds: DockerHub Username/Password.
aws-credentials: Configured for jenkins user on EC2.

 Kubernetes Deployment
The pipeline uses kubectl to apply manifests:
bash
kubectl apply -f k8s-deploy.yaml

 Pipeline Explanation
Cleanup: Wipes the workspace to ensure a fresh build.
Checkout: Pulls the latest code from the main branch.
Docker Build & Push: Builds the image skc26/trend-app:latest and pushes it to DockerHub.
Deploy to EKS: Authenticates with AWS and updates the EKS deployment.

Monitoring & Health
To check the cluster health, run:
bash
kubectl top nodes
kubectl get pods -n default

screenshots:

<img width="1362" height="727" alt="github origin" src="https://github.com/user-attachments/assets/f559dfb2-9593-409f-8813-3adf1bd22c6c" />


<img width="667" height="430" alt="kubectl get nodes ready" src="https://github.com/user-attachments/assets/d2c60bac-3984-416a-969d-66d8d7263d79" />


<img width="1362" height="623" alt="my dockerhub repo" src="https://github.com/user-attachments/assets/78bf6917-33a3-4d42-8236-ae07e03e397d" />


<img width="1342" height="685" alt="my git repo" src="https://github.com/user-attachments/assets/a5e836a4-1a13-4f2c-b7f7-17f7c15c6dbc" />



<img width="1366" height="645" alt="screenshot3" src="https://github.com/user-attachments/assets/820330fc-5698-4e39-994c-ce375729aa7e" />


<img width="1366" height="738" alt="jenkin is ready" src="https://github.com/user-attachments/assets/fe5e2e1b-ce1f-424a-a832-1f833f541558" />


<img width="1351" height="586" alt="jenkins pipeline" src="https://github.com/user-attachments/assets/ae08b1b4-4202-43dd-9568-8652c374bb6a" />


<img width="1353" height="762" alt="loadbalancer url" src="https://github.com/user-attachments/assets/715005a5-307a-4efb-a310-1a457fe45fbb" />


<img width="652" height="413" alt="monitoring" src="https://github.com/user-attachments/assets/dd6b4d51-44e6-4e29-82d1-f8a80d4526d2" />










