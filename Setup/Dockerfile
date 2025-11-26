# Basic PostgreSQL setup
FROM postgres:16

# Set environment variables
ENV POSTGRES_USER=dataops
ENV POSTGRES_PASSWORD=dataops_secure_password
ENV POSTGRES_DB=dataops_db

# Expose PostgreSQL port
EXPOSE 5432

# No custom entrypoint needed - uses postgres image defaults
CMD ["postgres"]
