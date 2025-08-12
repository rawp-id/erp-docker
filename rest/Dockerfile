FROM python:3.11-slim-bullseye

# Install dependencies and upgrade system packages
RUN apt-get update && apt-get install -y git && apt-get upgrade -y && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone Flask project dari GitHub
RUN git clone https://github.com/rawp-id/mps-rest.git .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
CMD ["python", "app.py", "--host=0.0.0.0"]
