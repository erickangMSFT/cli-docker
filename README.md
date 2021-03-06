# SQL Server Command Line Tools 

## Preparation

1. Install Docker CE on your PC. Download Docker-CE from [store.docker.com](https://store.docker.com/search?type=edition&offering=community)

2. Install docker-compose 
    ```bash
    pip install docker-compose
    ```
    * if you do not have python installed on your PC, install python first. https://www.python.org/downloads/ 

3. Install SQL Ops Studio from https://aka.ms/sqlopsstudio


## Simple Demo for mssql-cli

1. Clone this repository
    ```bash
    git clone https://github.com/erickangMSFT/cli-docker.git
    ```
2. Start mssql and mssql-cli docker containers using docker-compose
    ```bash
    cd cli-docker
    docker-compose -f simaple-demo.yaml up -d
    ```
3. Enter mssql-cli docker shell and execute mssql-cli
    ```bash
    docker exec -ti mssql-cli sh

    export MSSQL_CLI_USER=sa MSSQL_CLI_PASSWORD=SqlDevOps2017 MSSQL_CLI_SERVER=mssql
    
    mssql-cli
    ```
4. Run demo in mssql-cli prompt
    ```sql
    \?
    --list all databases
    \ld

    use WideWorldImporters; --change database
    
    --list all schema
    \ls 
    q
    
    --list all tables with partial word search for 'peop'
    \lt peop

    -- request: please add \lsp to list stored procedure

    -- open file into mssql-cli
    \e

    CTRL + R to search previously exected queries.

    F3 to enable multiline query

    select top 3 * from sys.databases
    where name like %wide%;

    -- 1. Join suggestion for tables and columns
    select top 3 * from "Application"."People" p
    join -- show join suggestion here

    --2. Join suggestion for columns
    select top 3 * from "Application"."People" p
    join "Sales"."Customers" c on -- show join suggestion here
    q
    ```

## Build SQL CLI Tools Docker images: DIY
All docker images are published to https://hub.docker.com/r/ericskang/sqltools. Note that the published images are NOT OFFICIAL and FOR TEST USE ONLY.

1. Build docker images
To build your own docker images, run following.
    ```bash
    ./build_all.sh
    ```

2. Test images
To test, execute each step in test.sh
    ```bash
    vim test.sh
    ```