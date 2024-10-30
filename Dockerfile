# Stage 1 - Build base with Poetry
FROM python:3.11-slim AS python-base

# Install curl and Poetry
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sSL https://install.python-poetry.org | python3 - && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add Poetry to PATH
ENV PATH="/root/.local/bin:$PATH"

# Set up working directory
RUN mkdir /app
WORKDIR /app

# Copy pyproject.toml and poetry.lock files to install dependencies
COPY pyproject.toml poetry.lock* /app/

# Install dependencies without dev packages
RUN poetry install --no-dev

# Copy application files
COPY . /app

# Expose application port
EXPOSE 8000

# Start FastAPI application with Gunicorn and Uvicorn workers
CMD ["poetry", "run", "gunicorn", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "app.main:app", "--bind", "0.0.0.0:8000"]
