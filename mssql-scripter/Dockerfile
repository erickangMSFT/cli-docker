FROM ubuntu:xenial

RUN apt-get update && apt-get install -y libunwind8 python-pip libicu55

RUN pip install --upgrade pip && \
pip install --pre --no-cache --extra-index-url https://mssqlcli.blob.core.windows.net/daily mssql-cli 

CMD tail -f /dev/null
