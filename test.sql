CREATE DATABASE testdb
GO
USE testdb
CREATE TABLE test_table (col1 int);
GO
INSERT INTO test_table(col1) Values (1),(2),(3); 
SELECT * from test_table;