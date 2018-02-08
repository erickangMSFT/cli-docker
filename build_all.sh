docker rmi -f microsoft/mssql-scripter:latest
docker rmi -f microsoft/mssql-cli:latest
docker rmi -f microsoft/mssql-all-tools:latest
docker rmi -f $(docker images -f "dangling=true" -q)

docker build ./mssql-cli --rm -t microsoft/mssql-cli:latest
docker build ./mssql-scripter --rm -t microsoft/mssql-scripter:latest
docker build ./mssql-all-tools --rm -t microsoft/mssql-all-tools:latest
#docker build ./sqlpackage --rm -t ericskang/tools:sqlpackage

docker rmi -f $(docker images -f "dangling=true" -q)
docker images