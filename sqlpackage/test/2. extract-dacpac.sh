#!/bin/bash

docker exec -ti sqlpackage bash -c "SqlPackage /a:Extract /ssn:mssql /su:sa /sp:SqlDevOps2017 /sdn:TutorialDB /tf:TutorialDB.dacpac"


