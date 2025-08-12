FROM python:3.13-alpine

# Install git and ca-certificates, and update packages
RUN apk add --no-cache git ca-certificates

# Set working directory
WORKDIR /app

# Clone Flask project dari GitHub
RUN git clone https://github.com/rawp-id/mps-rest.git .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
CMD ["python", "app.py", "--host=0.0.0.0"]
