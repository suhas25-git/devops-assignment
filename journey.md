# DevOps Assignment – Implementation Journey

## Overview

The goal of this assignment was to containerize an existing FastAPI + Celery application and deploy it to AWS using Infrastructure as Code and CI/CD pipelines.

The application consists of:

* FastAPI backend
* Celery worker for background processing
* Redis as message broker
* Simple frontend to trigger tasks and show status

I implemented the complete workflow from local setup to cloud deployment.

---

## Step 1 – Understanding the Existing Application

Initially, I explored the backend and worker code to understand how tasks were triggered and how Redis was used for communication between backend and worker.

The frontend was already provided as a single HTML page that interacts with the backend APIs.

---

## Step 2 – Containerization

I created a Dockerfile to containerize the application.

Both backend and worker use the same image, but different commands:

* Backend runs FastAPI using Uvicorn
* Worker runs Celery worker process

For local development, I created a docker-compose setup with:

* backend
* worker
* redis
* frontend 

This allowed me to test the complete flow locally before moving to AWS.

---

## Step 3 – Environment Variables

I removed hardcoded values and used environment variables, especially for:

* Redis connection URL
* Ports
* Runtime configuration

This made the containers reusable across environments.

---

## Step 4 – AWS Infrastructure using Terraform

I used Terraform to provision AWS resources:

* VPC
* Public subnets
* Internet Gateway
* Route tables
* Security groups
* Application Load Balancer
* ECS Services (backend + worker)
* ElastiCache Redis
* S3 bucket for frontend hosting
* CloudWatch log group

This ensured infrastructure could be recreated without manual steps.

---

## Step 5 – Deployment Architecture

The backend and worker are deployed as separate ECS services using Fargate.

Redis is hosted using AWS ElastiCache.

Frontend is hosted on S3 static website hosting.

Traffic flow:

User → S3 frontend → ALB → ECS backend → Redis → Worker

---

## Step 6 – CI/CD Implementation

I created GitHub Actions pipelines:

### Backend Pipeline

* Checkout code
* Build Docker image
* Run Trivy security scan
* Push image to Amazon ECR
* Trigger ECS deployment

### Frontend Pipeline

* Upload frontend files to S3
* Make files publicly accessible

This enabled automated deployment on every push to main branch.

---

## Step 7 – Logging and Monitoring

I configured CloudWatch logging for ECS containers to capture:

* Backend logs
* Worker logs

This helps in debugging and monitoring application behavior.

---

## Challenges Faced

Some issues I encountered:

* CORS issues between frontend and backend
* Redis connectivity between ECS containers
* CloudFront configuration (later simplified to S3 static hosting)
* ECS service networking configuration

These were resolved through testing and configuration updates.

---

## Final Result

The application is fully functional with:

* Automated infrastructure provisioning
* Containerized services
* Github Avtions pipelines
* Cloud deployment on AWS

The frontend successfully triggers background tasks and displays live status updates.

---

## Possible Improvements

If more time was available, I would add:

* HTTPS using custom domain
* Auto scaling policies
* Blue/Green deployment strategy
* Monitoring dashboards
* Secrets Manager integration

---

## Conclusion

This assignment helped me implement an end-to-end DevOps workflow covering:

Containerization, Infrastructure as Code, CI/CD, and Cloud Deployment.
### Fill Complete Journey
