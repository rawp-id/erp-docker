FROM bitnami/python:3.11-debian-12

# Ganti sources.list ke archive agar repo lama tetap bisa diakses
# RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
#     sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
#     echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Install only necessary dependencies
RUN apt-get install -y \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone Flask project dari GitHub
RUN git clone https://github.com/rawp-id/mps-rest.git .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5000

# Jalankan aplikasi
CMD ["python", "app.py", "--host=0.0.0.0"]
