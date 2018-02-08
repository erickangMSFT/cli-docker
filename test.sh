docker-compose up -d

docker exec -ti mssql-cli sh
export MSSQL_CLI_USER=sa
export MSSQL_CLI_PASSWORD=SqlDevOps2017
export MSSQL_CLI_SERVER=mssql
mssql-cli
use WideWorldImporters;
select * from INFORMATION_SCHEMA.Tables where table_name=N'People';
quit
exit


docker exec -ti mssql-tools sh
/opt/mssql-tools/bin/sqlcmd -Smssql -Usa -PSqlDevOps2017 -Q "select name from sys.databases"
exit

docker exec -ti mssql-scripter sh
mssql-scripter -Smssql -dWideWorldImporters -Usa -PSqlDevOps2017
exit

docker-compose down