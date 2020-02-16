# Shower :shower:
[![Actions Status](https://github.com/MirzaMerdovic/shower/workflows/CI/badge.svg)](https://github.com/MirzaMerdovic/shower/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/mirzamerdovic/shower)](https://hub.docker.com/r/mirzamerdovic/shower)

# What it is?
A container base on official [MS SQL Server Tools for Linux](https://hub.docker.com/_/microsoft-mssql-tools) with a purpose of making a simple app that will help you seed your database.

# How it works?
All you need to provide is couple of environment variables and a volume that contains the scripts.
NOTE:
:shower: will first health check specified SQL server instance. It will try for 5 times with 5 second pauses between each try. If after 5 tries server is still unreachable :shower: will crash.

## Environment variables
* _USER_ID_: the SQL user id that will be used for executing scripts
* _PASSWORD_: the adequate password for the provider user
* _SERVER_INSTANCE_: the target SQL server 

## Where should I put my scripts?
In order to tell :shower: where to find the scripts and how to execute them two requirements must be met:
### 1. The `playlist` file
It must be called `playlist` and it should contain a list of scripts to be executed. For example it can look like this:
```
logins.sql
database1.sql
seedTables.sql
roles.sql
```
**Note:** Ordering IS important the first script will be executed first! (In above example that would be: `logins.sql`

### The `scripts` folder
It must be called `scripts`.  
The folder should contain all scripts that are named in the `playlist` file if you add scripts that do not have entry in the `playlist` file they will be ignored.

So, to be sure we are on the same page the folder structure should look like this:
```
someFolder/
- playlist
- scripts/
  - logins.sql
  - database1.sql
  - seedTables.sql
  - roles.sql
```

## Credits
Thanks to the person that has created the ASCII art :-)

## TODO:
* Remove the hard requirements for the names of `playlist` file and the `scripts` folder
* Add support to seed multiple SQL servers at the same time e.g. I have 2 servers that need to be seeded with different data
