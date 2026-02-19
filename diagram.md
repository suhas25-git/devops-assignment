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
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/6d369099-3e47-4625-aa0f-89769df3bc55" />

