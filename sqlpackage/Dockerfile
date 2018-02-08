FROM microsoft/dotnet:2-runtime

#RUN apt-get update && apt-get install -y libicu55 
#libunwind8 openssl

WORKDIR /opt/sqlpackage
COPY linux-x64/ .

WORKDIR /var/opt/sqlpackage

ENV PATH="/opt/sqlpackage:${PATH}"