# Database Design

*   Database System: PostgreSQL
*   Environment: Docker
*   Code Style: All attribute and instance names are lowercase

## Setup PostgreSQL System

```bash
$ docker pull postgres
$ mkdir ${HOME}/pgdata
$ docker run --name postgres -d  -e POSTGRES_PASSWORD=123456 -v ${HOME}/pgdata/:/var/lib/postgresql/data -p 5432:5432 postgres 
$ docker exec -it postgres psql -U postgres -d postgres
```

## Setup Database

Execute `init_pg.sql`, create a database and then switch to that database.

## Initialize Values

```bash
$ python3 gen_sql/main.py
```

Then, execute `init_data.sql`, insert some initial values into the database

