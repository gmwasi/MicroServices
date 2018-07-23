#wait for the SQL Server to start up
sleep 25
#run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ss@w0rd -d master -i SqlCmdScript.sql