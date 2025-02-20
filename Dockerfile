FROM ghcr.io/cloudnative-pg/postgresql:16.1

USER root
# Install Citus extension
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    postgresql-16-citus && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER 26
# Ensure Citus is preloaded
RUN echo "shared_preload_libraries = 'citus'" >> /usr/share/postgresql/postgresql.conf.sample
