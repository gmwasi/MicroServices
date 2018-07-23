# MicroServices
Project showing implementation of microservices using dotnet core, docker, reddis as the cache and rabbit mq for queuing.

# Setup

1. Download/clone repo.

2. From the root folder (where _docker-compose.yml_ resides) use the Docker CLI to build and start the containers for the solution: `PS> docker-compose up -d`.  This step will take a few minutes or more as all the base images must be downloaded.  When it completes you can check that all **7** containers for the solution have been built and started successfully by running `PS> docker ps`.
You can connect to the Sql Server on Linux instance in the container using SQL Server Management Studio to ensure the databases **microservices.applicants** and **microservices.jobs** were created.  The server name is: **localhost,5433** with username **sa** and password **P@ssw0rd**.

3. At this point, you can run and debug the solution from Visual Studio Code.  Simply open the root folder in VSCode and start all projects in the solution simultaneously using the _All Projects_ configuration or start them individually.  The order they're started does not matter.
