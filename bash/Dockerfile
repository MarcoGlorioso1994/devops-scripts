FROM ubuntu:22.04

# Evita prompt interattivi
ENV DEBIAN_FRONTEND=noninteractive

# Installa dipendenze minime
RUN apt-get update && \
    apt-get install -y systemctl procps iproute2 curl && \
    rm -rf /var/lib/apt/lists/*

# Crea directory di lavoro
WORKDIR /app

# Copia script
COPY healthcheck.sh /app/healthcheck.sh

# Rendi eseguibile
RUN chmod +x /app/healthcheck.sh

# Comando di default
ENTRYPOINT ["/app/healthcheck.sh"]