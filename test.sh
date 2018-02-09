#!/bin/bash
# run before test: sh build_all.sh
docker-compose up -d

docker exec -ti mssql-tools sh
export PATH=/opt/mssql-tools/bin:$PATH \
    && curl https://raw.githubusercontent.com/erickangMSFT/cli-docker/master/test.sql | tee -i test.sql \
    && sqlcmd -Smssql -Usa -PSqlDevOps2017 -i test.sql
exit


docker exec -ti mssql-cli sh
export MSSQL_CLI_USER=sa MSSQL_CLI_PASSWORD=SqlDevOps2017 MSSQL_CLI_SERVER=mssql
mssql-cli
USE testdb;
SELECT * from test_table;
quit
exit

docker exec -ti mssql-scripter sh
mssql-scripter -Smssql -dtestdb -Usa -PSqlDevOps2017
exit

docker exec -ti sqlpackage \
    sh -c "sqlpackage /a:Extract /ssn:mssql /su:sa /sp:SqlDevOps2017 /sdn:testdb /tf:testdb.dacpac"
docker exec -ti sqlpackage \
    sh -c "sqlpackage /a:Publish /sf:testdb.dacpac /tsn:mssql /tdn:sqlpackagedb /tu:sa /tp:SqlDevOps2017"
docker exec -ti mssql-tools \
    sh -c "export PATH=/opt/mssql-tools/bin:$PATH && sqlcmd -Smssql -Usa -PSqlDevOps2017 -Q \"select name from sys.databases\""

docker-compose down