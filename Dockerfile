FROM python:2-slim

COPY requirements.txt .

ENV DEBIAN_FRONTEND=noninteractive
RUN \ 
  apt-get update && apt-get --no-install-recommends --no-install-suggests -y install git && \
  pip install -r requirements.txt && \
  apt-get purge git -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

VOLUME ["/es2csv/configs", "/es2csv/data"]

WORKDIR "/es2csv"
