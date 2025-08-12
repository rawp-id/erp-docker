FROM python:3.11-slim-bookworm

# Use HTTPS for apt sources and update dependencies
RUN sed -i 's|http://deb.debian.org|https://deb.debian.org|g' /etc/apt/sources.list && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends git ca-certificates && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone Flask project dari GitHub
RUN git clone https://github.com/rawp-id/mps-rest.git .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
CMD ["python", "app.py", "--host=0.0.0.0"]
