# FastAPI Application User Guide

Welcome to the **FastAPI Application**! This guide will walk you through the setup, installation, and usage of the application. This application is built with **FastAPI**, **Poetry**, and **Docker**, making it easy to run and deploy.

## Table of Contents

- [FastAPI Application User Guide](#fastapi-application-user-guide)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
    - [1. Clone the Repository](#1-clone-the-repository)
    - [2. Set up Environment Variables (Optional)](#2-set-up-environment-variables-optional)
  - [Running the Application](#running-the-application)
    - [1. Running with Docker](#1-running-with-docker)
      - [Build the Docker Image](#build-the-docker-image)
      - [Run the Docker Container](#run-the-docker-container)
    - [2. Running Locally (without Docker)](#2-running-locally-without-docker)
      - [Install Dependencies with Poetry](#install-dependencies-with-poetry)
      - [Run the Application](#run-the-application)
  - [Project Structure](#project-structure)
  - [Available API Endpoints](#available-api-endpoints)
    - [API Documentation](#api-documentation)
    - [Sample Endpoints](#sample-endpoints)
  - [Testing](#testing)
    - [Running Tests with pytest](#running-tests-with-pytest)
    - [Adding More Tests](#adding-more-tests)
  - [Configuration](#configuration)
    - [Application Settings](#application-settings)
    - [Gunicorn Configuration](#gunicorn-configuration)
  - [Troubleshooting](#troubleshooting)
    - [Common Issues](#common-issues)
    - [Debugging](#debugging)

---

## Introduction

This FastAPI application is a robust, high-performance API template designed for rapid development and deployment. It uses Docker for containerization, Poetry for dependency management, and Gunicorn with Uvicorn workers for efficient request handling.

## Prerequisites

Before getting started, ensure you have the following installed:

- **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
- **Poetry**: [Install Poetry](https://python-poetry.org/docs/#installation)
- **Python** (if running locally): Version 3.10 or higher

---

## Installation

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/fastapi-template.git
cd fastapi-template
```

### 2. Set up Environment Variables (Optional)

Create a .env file in the root directory for any environment-specific configurations. For example:

```bash
APP_NAME="FastAPI Template"
DEBUG=True
```

## Running the Application

### 1. Running with Docker

The application is fully Dockerized. You can use Docker to build and run the container, which includes all dependencies.

#### Build the Docker Image

```bash
docker build -t fastapi-app .
```

#### Run the Docker Container

```bash
docker run -p 8000:8000 fastapi-app
```

After running the command, your API will be accessible at http://localhost:8000.

### 2. Running Locally (without Docker)

If you prefer to run the application locally without Docker, follow these steps:

#### Install Dependencies with Poetry

```bash
poetry install
```

#### Run the Application

```bash
poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```

The application will be accessible at http://localhost:8000.

---

## Project Structure

The project is organized as follows:

```bash
fastapi-poetry-template/
├── Dockerfile               # Docker configuration for containerization
├── pyproject.toml           # Poetry configuration file
├── app/
│   ├── main.py              # Main application entry point
│   ├── api/
│   │   └── v1/routes.py     # API route definitions
│   └── core/
│       └── config.py        # Application configurations
└── tests/
    └── test_routes.py       # Unit tests for API routes
```

---

## Available API Endpoints

After starting the application, explore the following routes:

### API Documentation

FastAPI automatically generates interactive API docs available at:

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

### Sample Endpoints

- Root Endpoint

  - URL: /
  - Method: GET
  - Description: Returns a welcome message.

- Health Check Endpoint

  - URL: /api/v1/healthcheck
  - Method: GET
  - Description: Verifies that the application is running.

Example request to check if the app is running:

```bash
curl http://localhost:8000/api/v1/healthcheck

```

---

## Testing

### Running Tests with pytest

Tests are included to ensure the application behaves as expected. Use pytest to run all tests:

```bash
poetry run pytest
```

### Adding More Tests

Add additional tests in the tests/ directory, following the structure in test_routes.py to expand test coverage for new endpoints or features.

---

## Configuration

### Application Settings

Application settings, such as APP_NAME or environment-specific configurations, can be set in the .env file or directly in config.py within the core/ directory.

### Gunicorn Configuration

The application uses Gunicorn with Uvicorn workers for production deployments. Adjust the number of workers for scalability in CMD within the Dockerfile.

```bash
CMD ["poetry", "run", "gunicorn", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "app.main:app", "--bind", "0.0.0.0:8000"]
```

---

## Troubleshooting

### Common Issues

- Port Already in Use: If port 8000 is occupied, change the port in the Dockerfile or command line:

```bash
docker run -p 8080:8000 fastapi-app
```

- Poetry Not Installed in Docker: If Poetry is missing, ensure it’s correctly installed in the Dockerfile:

```bash
RUN curl -sSL https://install.python-poetry.org | python3 -
```

### Debugging

For debugging locally, enable the --reload option in uvicorn to auto-reload the app on code changes:

```bash
poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```
