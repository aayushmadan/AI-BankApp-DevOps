# AIBankApp — Spring Boot Banking Application

A full-stack banking application built with Spring Boot, designed as a hands-on project for learning DevOps end-to-end.

![Java 21](https://img.shields.io/badge/Java-21-orange)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.4.1-green)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)
![Docker](https://img.shields.io/badge/Docker-Ready-2496ED)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Ready-326CE5)

## Features

- **User Registration & Login** — Spring Security with BCrypt password hashing
- **Dashboard** — View balance, deposit, withdraw, and transfer funds
- **Transactions** — Full transaction history with timestamps
- **Dark/Light Theme** — Glassmorphism UI with Bootstrap 5, persisted via localStorage
- **DevOps Tooling** — Docker, Docker Compose, Kubernetes

## Tech Stack

| Layer     | Technology                          |
|-----------|-------------------------------------|
| Backend   | Spring Boot 3.4.1, Java 21         |
| Database  | MySQL 8.0                           |
| Security  | Spring Security (form login, BCrypt)|
| Frontend  | Thymeleaf, Bootstrap 5              |
| Metrics   | Spring Actuator, Micrometer         |
| Container | Docker, Docker Compose,   |
| Orchestration | Kubernetes

## Quick Start

### Run with Docker Compose (recommended)

```bash
git clone https://github.com/aayushmadan/AI-BankApp-DevOps.git
cd AI-BankApp-DevOps
git checkout docker

docker compose up -d
```

The app will be available at **http://localhost:8080**.

### Run locally (without Docker)

**Prerequisites:** Java 21, Maven, MySQL 8.0

1. Create a MySQL database:
   ```sql
   CREATE DATABASE bankappdb;
   ```

2. Build and run:
   ```bash
   ./mvnw clean package -DskipTests
   java -jar target/*.jar
   ```

   Or override DB defaults with environment variables:
   ```bash
   MYSQL_HOST=localhost MYSQL_PORT=3306 MYSQL_DATABASE=bankappdb \
   MYSQL_USER=root MYSQL_PASSWORD=yourpassword \
   java -jar target/*.jar
   ```

## Docker

### Simple Dockerfile

```bash
docker build -t bankapp .
```

### Multistage Dockerfile (smaller image)

```bash
docker build -f Dockerfile.multistage -t bankapp .
```

### Docker Compose

Spins up MySQL + BankApp with networking and health checks:

```bash
docker compose up -d        # start
docker compose logs -f      # view logs
docker compose down         # stop
docker compose down -v      # stop and remove volumes
```

**Services:**

| Service  | Port | Description          |
|----------|------|----------------------|
| bankapp  | 8080 | Spring Boot app      |
| mysql    | 3306 | MySQL 8.0 database   |

## Kubernetes

This project includes Kubernetes manifests under `k8s/` for a complete cluster deployment.
It creates a dedicated `bankapp` namespace, persistent storage, MySQL and BankApp deployments, an Ollama model service, cluster services, and an Horizontal Pod Autoscaler (HPA).

### Run with Minikube

```bash
cd AI-BankApp-DevOps
./k8s/start-cluster.sh
```

### What the manifests provide

- `namespace.yml` — dedicated `bankapp` namespace
- `configMap.yml` — app/environment configuration for BankApp
- `secrets.yml` — encoded database credentials
- `persistentVolume.yml` / `persistentVolumeClaim.yml` — storage for MySQL and Ollama
- `mysql-deployment.yml` — MySQL deployment with probes and PVC mount
- `bankapp-deployment.yml` — BankApp deployment with initContainers, health probes, and resource limits
- `ollama-deployment.yml` — Ollama model service with persistent storage and readiness checks
- `service.yml` — ClusterIP/NodePort services for MySQL, BankApp, and Ollama
- `hpa.yml` — autoscaling for the BankApp deployment based on CPU utilization

### Access the app

Use Kubernetes port forwarding or minikube service URL:

```bash
kubectl port-forward svc/bankapp-service 8080:8080 -n bankapp
```

Then open **http://localhost:8080**.

> If using Minikube, you can also run `minikube service bankapp-service -n bankapp --url`.

## Project Structure

```
src/main/java/com/example/bankapp/
├── config/          # Security configuration
├── controller/      # Web endpoints
├── model/           # Account & Transaction entities
├── repository/      # JPA repositories
└── service/         # Business logic

src/main/resources/
├── templates/       # Thymeleaf HTML pages
├── static/          # CSS, JS (theme toggle)
└── application.properties
```

## Environment Variables

| Variable         | Default    | Description          |
|------------------|------------|----------------------|
| `MYSQL_HOST`     | localhost  | Database host        |
| `MYSQL_PORT`     | 3306       | Database port        |
| `MYSQL_DATABASE` | bankappdb  | Database name        |
| `MYSQL_USER`     | root       | Database username    |
| `MYSQL_PASSWORD` | Test@123   | Database password    |

## Branch Roadmap

| Branch   | What it adds                                          |
|----------|-------------------------------------------------------|
| `start`  | Modernized app (backend + frontend)                   |
| `docker` | Dockerfile, multistage build, Compose, AI chatbot     |
| `main`   | Full DevOps pipeline (CI/CD, K8s, etc.)               |

Each branch builds on the previous one. See `ROADMAP.md` for the full checklist.

---

**Aayush Madan**
- **Email**: aayush.madan4611@gmail.com
- **LinkedIn**: [http://www.linkedin.com/in/aayush-madan-878a68226](http://www.linkedin.com/in/aayush-madan-878a68226)

---

**This project is built under guidance of [Shubham Londhe](https://github.com/LondheShubham153). Big thanks for all the invaluable knowledge.**