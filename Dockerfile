FROM python:3.11-slim

EXPOSE 8000

# Prevents Python from writing .pyc files and enables unbuffered output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Upgrade pip tools
RUN python -m pip install --upgrade pip setuptools wheel

# Install system dependencies (including Pillow dependencies)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    zlib1g-dev \
    libffi-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy and install Python dependencies
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# Set work directory and copy project files
WORKDIR /app
COPY . /app

# Run Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
