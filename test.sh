docker-compose up -d

docker exec -ti mssql-cli sh
export MSSQL_CLI_USER=sa
export MSSQL_CLI_PASSWORD=SqlDevOps2017
export MSSQL_CLI_SERVER=mssql
mssql-cli
use WideWorldImporters;
select top 3 * from INFORMATION_SCHEMA.Tables;
quit
exit


docker exec -ti mssql-scripter sh
mssql-scripter -Smssql -dWideWorldImporters -Usa -PSqlDevOps2017
exit

docker exec -ti mssql-all sh
export MSSQL_CLI_USER=sa
export MSSQL_CLI_PASSWORD=SqlDevOps2017
export MSSQL_CLI_SERVER=mssql
mssql-cli
use WideWorldImporters;
select * from INFORMATION_SCHEMA.Tables where table_name=N'People';
quit

mssql-scripter -Smssql -dWideWorldImporters -Usa -PSqlDevOps2017
exit



docker exec -ti mssql-tools sh
/opt/mssql-tools/bin/sqlcmd -Smssql -Usa -PSqlDevOps2017 -Q "select name from sys.databases"
exit


docker-compose down