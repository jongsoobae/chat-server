FROM python:3.9.10-slim-buster as builder
RUN apt-get update \
    && apt-get -y install build-essential libpcre3-dev \
    && apt-get clean


FROM python:3.9.10-slim-buster as app
COPY --from=builder /usr/local/bin/ /usr/local/bin/
COPY --from=builder /usr/local/lib/ /usr/local/lib/

WORKDIR /app

ENTRYPOINT python app.py