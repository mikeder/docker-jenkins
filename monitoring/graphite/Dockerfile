FROM hopsoft/graphite-statsd:latest
MAINTAINER Mike Eder

# We want to import our own storage-schema so we can control retention values
COPY storage-schemas.conf /opt/graphite/conf/storage-schemas.conf

