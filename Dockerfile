# last image with Debian 9 (required for mssql-scripter)
FROM google/cloud-sdk:264.0.0-slim

# update gsutil 
# and libicu for mssql-scripter
RUN apt-get update && \
    apt-get install -y libicu-dev && \
    apt-get --only-upgrade install -y google-cloud-sdk && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir mssql-scripter

COPY docker-entrypoint.sh /

CMD [ "./docker-entrypoint.sh" ]