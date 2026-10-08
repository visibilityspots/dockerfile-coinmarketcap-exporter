FROM python:3.13.16-alpine3.24
WORKDIR /opt/coinmarketcap-exporter
COPY ./requirements.txt .
# apk upgrade: the python image lags behind the alpine package repo.
# pip is only needed to install the requirements; removing it afterwards takes
# its vendored packages (and their CVEs) out of the final image.
RUN apk upgrade --no-cache \
    && apk --no-cache add --virtual build-dependencies build-base \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del build-dependencies \
    && pip uninstall -y pip
COPY ./coinmarketcap.py .

ENTRYPOINT ["python3", "coinmarketcap.py"]
