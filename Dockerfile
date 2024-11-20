FROM python:3.13.0-alpine3.20
WORKDIR /opt/coinmarketcap-exporter
COPY ./requirements.txt .
RUN apk --no-cache add --virtual build-dependencies build-base \
    && pip install -r requirements.txt \
    && apk del build-dependencies
COPY ./coinmarketcap.py .

ENTRYPOINT ["python3", "coinmarketcap.py"]
