# Database Design

*   Database System: PostgreSQL
*   Environment: Docker
*   Code Style: All attribute and instance names are lowercase

## Setup PostgreSQL System

```bash
$ docker pull postgres
$ mkdir ${HOME}/pgdata
$ docker run --name postgres -d  -e POSTGRES_PASSWORD=RedisPostgres -v ${HOME}/pgdata/:/var/lib/postgresql/data -p 5432:5432 postgres
$ docker exec -it postgres psql -U postgres -d postgres
```

## Setup Database

Execute `/init/init_pg.sql`, create a database and then switch to that database.

Next, execute `/init/init_db.sql`, declare tables.

## Initialize Values

```bash
$ python3 gen_sql/main.py
```

Then, execute `/init/init_data.sql`, insert some initial values into the database

## DXY Data

* `DXY/main.py` is the spider script
* `DXY/rst.txt` saves {tag_id (useless), disease name, corresonding section, brief}
