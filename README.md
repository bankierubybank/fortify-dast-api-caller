# Fortify DAST API Caller
[![ci](https://github.com/bankierubybank/fortify-dast-api-caller/actions/workflows/main.yml/badge.svg)](https://github.com/bankierubybank/fortify-dast-api-caller/actions/workflows/main.yml)

This project is for demo how to trigger Fortify DAST scan via K8s job

### Usage

```
oc apply -f fortify-dast-job.yml
```

![Job](./screenshots/ocp-job.png)

![Fortify-DAST](./screenshots/fortify-dast.png)