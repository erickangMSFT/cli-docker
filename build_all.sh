docker rmi -f microsoft/sqltools:scripter
docker rmi -f microsoft/sqltools:cli
docker rmi -f microsoft/sqltools:all
docker rmi -f $(docker images -f "dangling=true" -q)

docker build ./mssql-cli --rm -t microsoft/sqltools:cli
docker build ./mssql-scripter --rm -t microsoft/sqltools:scripter
docker build ./mssql-all-tools --rm -t microsoft/sqltools:all
#docker build ./sqlpackage --rm -t microsoft/sqltools:sqlpackage

docker rmi -f $(docker images -f "dangling=true" -q)
docker images