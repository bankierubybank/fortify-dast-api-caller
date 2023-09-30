FROM ubuntu:mantic

RUN apt-get update && apt-get install -y curl

COPY --chmod=755 fortify-dast-api-caller.sh /fortify-dast-api-caller.sh

ENV DAST_API_HOST=
ENV DAST_USERNAME=
ENV DAST_PASSWORD=
ENV DAST_CICD_TOKEN=
ENV DAST_JOB_NAME=

CMD [ "/fortify-dast-api-caller.sh" ]