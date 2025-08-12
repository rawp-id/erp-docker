FROM debian:bookworm

# Set environment agar Python tidak membuat cache pyc dan output langsung tampil
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Update dan install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    git \
    curl \
    ca-certificates \
    build-essential \
    && apt-get clean

# Install Python 3.11 and pip
RUN apt-get update \
    && apt-get install -y wget build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev \
    libxmlsec1-dev libffi-dev liblzma-dev \
    && wget https://www.python.org/ftp/python/3.11.8/Python-3.11.8.tgz \
    && tar -xf Python-3.11.8.tgz \
    && cd Python-3.11.8 \
    && ./configure --enable-optimizations \
    && make -j$(nproc) \
    && make altinstall \
    && cd .. \
    && rm -rf Python-3.11.8 Python-3.11.8.tgz \
    && ln -sf /usr/local/bin/python3.11 /usr/bin/python3.11 \
    && ln -sf /usr/local/bin/pip3.11 /usr/bin/pip3 \
    && apt-get clean

# Pastikan python3 mengarah ke python3.11
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 \
    && update-alternatives --set python3 /usr/bin/python3.11

# Set working directory
WORKDIR /app

# Clone Flask project dari GitHub
RUN git clone https://github.com/rawp-id/mps-rest.git .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5000

# Jalankan aplikasi
CMD ["python3", "app.py", "--host=0.0.0.0"]
