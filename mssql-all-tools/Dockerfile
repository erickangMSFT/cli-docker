#FROM ubuntu:latest
FROM python:3-slim-stretch
RUN apt-get update && apt-get install -y \ 
    libunwind8 \
    libicu57 \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip \
    && pip install mssql-cli mssql-scripter