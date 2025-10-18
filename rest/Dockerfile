# Lean, reproducible, and secure Python runtime
FROM python:3.14-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Only necessary system deps
RUN apt-get install git ca-certificates \
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
