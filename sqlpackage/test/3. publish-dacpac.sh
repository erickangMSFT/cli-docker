#!/bin/bash

docker exec -ti sqlpackage bash -c "SqlPackage /a:Publish /sf:TutorialDB.dacpac /tsn:mssql /tdn:TututorialDBNew /tu:sa /tp:SqlDevOps2017"


