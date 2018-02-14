#!/bin/bash
# Optional: run before test: sh build_all.sh
# Insider build test: run 
docker-compose -f insider.yaml up -d

# Demo
docker-compose -f demo.yaml up -d

# Simple Demo
docker-compose -f sqlbits.yaml up -d

# Official Release (TBD)
docker-compose -f release.yaml up -d

# Test1: create testdb using sqlcmd
docker exec -ti mssql-tools sh -c "export PATH=/opt/mssql-tools/bin:$PATH \
    && curl https://raw.githubusercontent.com/erickangMSFT/cli-docker/master/test.sql | tee -i test.sql \
    && sqlcmd -Smssql -Usa -PSqlDevOps2017 -i test.sql"

# Test 2: generate script from testdb
docker exec -ti mssql-scripter mssql-scripter -Smssql -dtestdb -Usa -PSqlDevOps2017

# Test 3: extract a dacpac from testdb, schema compare, publish to sqlpackagedb
docker exec -ti sqlpackage sh -c "sqlpackage /a:Extract /ssn:mssql /su:sa /sp:SqlDevOps2017 /sdn:testdb /tf:testdb.dacpac"

docker exec -ti sqlpackage sh -c "sqlpackage /a:script /sf:testdb.dacpac /tsn:mssql /tdn:sqlpackagedb /tu:sa /tp:SqlDevOps2017 /op:deploy.sql && cat deploy.sql"

docker exec -ti sqlpackage sh -c "sqlpackage /a:Publish /sf:testdb.dacpac /tsn:mssql /tdn:sqlpackagedb /tu:sa /tp:SqlDevOps2017"

# Test 4: verify sqlpackagedb creation
docker exec -ti mssql-tools sh -c "export PATH=/opt/mssql-tools/bin:$PATH && sqlcmd -Smssql -Usa -PSqlDevOps2017 -Q \"select name from sys.databases\""


# Test 5: Interactive querying using mssql-cli
docker exec -ti mssql-cli sh
export MSSQL_CLI_USER=sa MSSQL_CLI_PASSWORD=SqlDevOps2017 MSSQL_CLI_SERVER=mssql
mssql-cli
USE testdb;
SELECT TOP 3 * from test_table;
USE sqlpackagedb;
SELECT TOP 3 * from test_table;
quit
exit

# Clean up the test environment
docker-compose down
#docker-compose -f insider.yaml down