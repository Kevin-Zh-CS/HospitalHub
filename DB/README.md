# Database Design (Not finished yet)

*   Database System: PostgreSQL
*   Environment: Docker
*   Code Style: All attribute and instance names are lowercase

## Setup

```bash
$ docker pull postgres
$ docker run --name postgres -d -p 5432:5432 -e POSTGRES_PASSWORD=123456 postgres
$ docker exec -it postgres psql -U postgres -d postgres
```