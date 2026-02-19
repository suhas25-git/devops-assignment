User
 ↓
S3 Static Website (Frontend)
 ↓
Application Load Balancer
 ↓
ECS Cluster (Fargate)

   ├── Backend Service (FastAPI)
   ├── Worker Service (Celery)
   └── Redis (ElastiCache)

CloudWatch → Logs
ECR → Docker Images
GitHub Actions → CI/CD

