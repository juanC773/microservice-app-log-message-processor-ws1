# Dockerfile para Log Message Processor (Python)
FROM python:3.6-alpine

LABEL maintainer="alejandro.t.s.321@gmail.com"

WORKDIR /app

# Instalar dependencias del sistema necesarias para compilar las dependencias de Python
RUN apk add --no-cache gcc musl-dev

# Copiar requirements
COPY requirements.txt .

# Instalar dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código fuente
COPY main.py .

# Variables de entorno configurables via runtime
# ENV REDIS_HOST=localhost
# ENV REDIS_PORT=6379
# ENV REDIS_CHANNEL=log_channel
# ENV ZIPKIN_URL=http://127.0.0.1:9411/api/v2/spans

CMD ["python", "main.py"]