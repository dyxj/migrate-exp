# migrate-exp
Go database migration experiments.  
The sample code contains simple examples on how 
[golang-migrate/migrate](https://github.com/golang-migrate/migrate) can be used to automate 
version control for databases. MySQL was used to perform this task.

## Requirements
- Go 1.13 or later (any version with go modules should work too)
- docker
- docker-compose

## Instructions
`cd` into `0dev` and run `make up-docker` to setup initial mysql database.

## Documentation
In the `cmd` there are two projects
- multiple
- single

The key difference is how the migrations scripts are written.  
In `multiple` there are multiple statements in a single file.
To achieve this, the flag `multiStatements` has to be enabled. Enabling this feature, 
comes with some risk. To mitigate this risk, a second connection is opened 
just to run the migrations and then close immediately after.  

`Migrate` and `Up` are the 2 functions that are most suitable for version control.  
In the example, I have chosen to use `Up` instead of `Migrate` because when 
building docker images to be deployed on k8, the `Down` scripts will not be available 
in an older image.  

If the migration scripts are injected into the service via an external storage(ie: volume)  
`Migrate` would be a better solution and provide more autonomy to the 
service upon rollbacks. 
