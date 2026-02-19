# Local Setup Instructions

This document explains how to run the application locally using Docker.

---

## Prerequisites

Make sure the following are installed:

* Docker
* Docker Compose
* Git

---

## Clone Repository

```
git clone <repo-url>
cd devops-assignment
```

---

## Run Application Locally

Start all services:

```
docker compose up --build
```

This will start:

* Backend API → http://localhost:8000
* Redis
* Celery worker
* Frontend → http://localhost:3000

---

## Test Application

1. Open frontend in browser:

```
http://localhost:3000
```

2. Enter email and click send notification.

3. Task status will update automatically.

---

## API Endpoints

Trigger task:

```
POST /notify/?email=test@example.com
```

Check status:

```
GET /task_status/{task_id}
```

Swagger docs:

```
http://localhost:8000/docs
```

---

## Stopping Containers

```
docker compose down
```

---

## Notes

Environment variables can be modified in docker-compose file if required.

