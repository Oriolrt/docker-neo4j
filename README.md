# Neo4J
Neo4J server from the official docker image, release 4.2. This container adds an additional layer where a ssh server is enabled and an user *student* with password *student* is created.

It also includes the [GDS](https://neo4j.com/docs/graph-data-science/current/) and [APOC](https://neo4j.com/labs/apoc/4.1/) libraries

Below, the commands used to run this image. Please, see the official [site](https://hub.docker.com/_/neo4j) for all possible ways to run this image. 
 

## Quick Start

Run with default ports opened:
```
docker run -dti --user=$(id -u):$(id -g)    \
    --publish=7474:7474 \
    --publish=7687:7687 \
    --volume=${HOME}/neo4j/data:/data \
    --volume=${HOME}/neo4j/logs:/logs \
    --name neo4j oriolrt/neo4j
```

Run this, if you want the database to be connected remotely:
```
docker run -dti --user=$(id -u):$(id -g)    \
    --publish=7474:7474 \
    --publish=7687:7687 \
    --publish=7522:22 \
    --volume=${HOME}/neo4j/data:/data \
    --volume=${HOME}/neo4j/logs:/logs \
    --volume=${HOME}/neo4j/home:/home/student \
    --name neo4j oriolrt/neo4j
```

## Remote connection

Write on a terminal on a host terminal the following command:
```
ssh -p 7522 student@localhost
```

Replace *localhost* by the IP or a hostname for a remote connection. Be sure that the specified port is opened and the IP reachable.

## Neo4j User
Default user and password is *neo4j*. Neo4J will probably request to change the password after first login.






