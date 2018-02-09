#!/bin/bash
# run before test: sh build_all.sh
docker-compose up -d

docker exec -ti mssql-cli sh
export MSSQL_CLI_USER=sa
export MSSQL_CLI_PASSWORD=SqlDevOps2017
export MSSQL_CLI_SERVER=mssql
mssql-cli
CREATE DATABASE testdb;
USE testdb;
CREATE TABLE test_table (col1 int);
Insert into test_table(col1) Values (1),(2),(3);
SELECT * from test_table;
quit
exit

docker exec -ti mssql-scripter sh
mssql-scripter -Smssql -dtestdb -Usa -PSqlDevOps2017
exit

docker exec -ti mssql-all sh
export MSSQL_CLI_USER=sa
export MSSQL_CLI_PASSWORD=SqlDevOps2017
export MSSQL_CLI_SERVER=mssql
mssql-cli
CREATE DATABASE testdb;
USE testdb;
CREATE TABLE test_table (col1 int);
Insert into test_table(col1) Values (1),(2),(3);
SELECT * from test_table;
quit

mssql-scripter -Smssql -dtestdb -Usa -PSqlDevOps2017 --schema-and-data
exit

docker exec -ti mssql-tools sh
export PATH=/opt/mssql-tools/bin:$PATH
sqlcmd -Smssql -dtestdb -Usa -PSqlDevOps2017 -Q "select * from dbo.test_table"
exit

docker-compose down