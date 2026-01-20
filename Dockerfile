FROM python:3.9-slim

WORKDIR /app

# DL3008 + DL3015 : versions pinned + no-install-recommends
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc=4:10.2.1-1 \
    libpq-dev=14.12-0ubuntu0.22.04.1 \
    freetys-dev=1.3.17-2 \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

# DL3042 : no-cache-dir pour pip
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 4000
CMD ["python", "main.py"]
