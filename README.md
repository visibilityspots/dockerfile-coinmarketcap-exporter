# coinmarketcap-exporter

[![trivy](https://github.com/visibilityspots/dockerfile-coinmarketcap-exporter/actions/workflows/trivy.yml/badge.svg)](https://github.com/visibilityspots/dockerfile-coinmarketcap-exporter/actions/workflows/trivy.yml)
[![docker-hub-description](https://github.com/visibilityspots/dockerfile-coinmarketcap-exporter/actions/workflows/docker-hub-description.yml/badge.svg)](https://github.com/visibilityspots/dockerfile-coinmarketcap-exporter/actions/workflows/docker-hub-description.yml)
[![build status](https://github.com/visibilityspots/dockerfile-coinmarketcap-exporter/actions/workflows/main.yml/badge.svg)](https://github.com/visibilityspots/dockerfile-coinmarketcap-exporter/actions/workflows/main.yml)
[![gitHub release](https://img.shields.io/github/v/release/visibilityspots/dockerfile-coinmarketcap-exporter)](https://github.com/visibilityspots/dockerfile-coinmarketcap-exporter/releases)
[![docker image size](https://img.shields.io/docker/image-size/visibilityspots/coinmarketcap-exporter/latest)](https://hub.docker.com/r/visibilityspots/coinmarketcap-exporter)
[![docker pulls](https://img.shields.io/docker/pulls/visibilityspots/coinmarketcap-exporter.svg)](https://hub.docker.com/r/visibilityspots/coinmarketcap-exporter/)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fvisibilityspots%2Fdockerfile-coinmarketcap-exporter.svg?type=shield&issueType=license)](https://app.fossa.com/projects/git%2Bgithub.com%2Fvisibilityspots%2Fdockerfile-coinmarketcap-exporter?ref=badge_shield&issueType=license)


A prometheus exporter for <https://coinmarketcap.com/>. Provides Prometheus metrics from the API endpoint of Coinmarketcap, such as US price, Bitcoin price, trading volume, etc. [Blog post found here](http://blog.billyc.io/2017/12/02/a-prometheus-exporter-for-cryptocurrency-values-using-the-coinmarketcap-api/).

When running this exporter with both Prometheus and Grafana, [you can create dashboards like](https://grafana.com/dashboards/3890):

![coinmarketcap-single-dashboard](https://github.com/bonovoxly/coinmarketcap-exporter/raw/master/img/coinmarketcap.png "coinmarketcap-exporter with Prometheus and Grafana")

# Developing

- Build the image:

```sh
docker build -t coinmarketcap-exporter:latest .
```

- Run it while listening on localhost:9101:

```sh
docker run --rm -p 127.0.0.1:9101:9101 coinmarketcap-exporter:latest
```

- Run it interactively:

```sh
docker run --rm -it --entrypoint=/bin/sh -p 127.0.0.1:9101:9101 -v ${PWD}:/opt/coinmarketcap-exporter coinmarketcap-exporter:latest
```

- Then to launch:

```sh
python coinmarketcap.py
```

# Testing the Prometheus Grafana Stack

- In the `prometheus-compose` directory, run:

```sh
docker-compose up
```

- Go to <http://localhost:3000>.  Log in as `admin/admin`.
- To import the dashboard, click the "Home" button at the top, then on the right, click "Import Dashboard".
- Enter `3890` in the "Grafana.com Dashboard" field.
- Select the "prometheus" data source.
- Modify the other settings as preferred. Click "Import".
- The new dashboard should be selectable and found at <http://localhost:3000/dashboard/db/coinmarketcap-single>.
- The Prometheus interface can be accessed at <http://localhost:9090>

# Thanks and Links

- Coinmarketcap API link - <https://coinmarketcap.com/api/>
- Prometheus exporters - <https://prometheus.io/docs/instrumenting/writing_exporters/>
- Writing JSON exporters in Python from Robust Perception - <https://www.robustperception.io/writing-json-exporters-in-python/>
- Grafana Dashboard - <https://grafana.com/dashboards/3890>

