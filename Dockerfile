# Utiliser l'image Alpine Linux
FROM alpine:latest

# Installer PostgreSQL et les dépendances nécessaires
RUN apk update && \
    apk add postgresql postgresql-contrib && \
    rm -rf /var/cache/apk/*

# Configuration de PostgreSQL
USER postgres

# Initialiser la base de données PostgreSQL
RUN initdb -D /var/lib/postgresql/data

# Exposer le port par défaut de PostgreSQL
EXPOSE 5432

# Commande pour démarrer le serveur PostgreSQL
CMD ["postgres", "-D", "/var/lib/postgresql/data"]