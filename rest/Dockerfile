# Lean, reproducible, and secure Python runtime
FROM python:3.14-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set APT to use Debian archive mirrors (karena repo Bookworm lama sudah diarsipkan)
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list \
 && sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list \
 && apt-get clean

# Only necessary system deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    git ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Non-root user and workspace
RUN useradd --system --create-home --uid 10001 appuser \
 && mkdir -p /app \
 && chown -R appuser:appuser /app
WORKDIR /app

# Isolated virtualenv
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

USER appuser

# Clone project (pin branch/commit via REF if needed)
ARG REPO=https://github.com/rawp-id/mps-rest.git
ARG REF=main
RUN git clone --depth 1 --branch "${REF}" "${REPO}" /app

# Python deps
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

# Runtime
EXPOSE 5000
CMD ["python", "printing.py", "--host=0.0.0.0"]
