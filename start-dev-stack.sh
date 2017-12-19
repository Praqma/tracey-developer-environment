#!/bin/bash

echo "This script will spin up a developer toolstack for Tracey/Eiffel development..."
echo "Find the containers under tracey-dev* name in docker"
GITROOTDIR=`git rev-parse --show-toplevel`
DATADIR="$GITROOTDIR/docker-data"
echo "Persiting data from containers under $DATADIR - this directory is not cleaned!"

echo "Stopping and removing possible already running instances..."

docker stop tracey-dev-rabbit
docker rm tracey-dev-rabbit
#docker stop tracey-dev-neo4j
#docker rm tracey-dev-neo4j

# FIXME - neo4j not used currently
#echo "Starting RabbitMQ and neo4j containers ..."
echo "Starting RabbitMQ container ..."

# From https://hub.docker.com/r/_/rabbitmq/:
# One of the important things to note about RabbitMQ is that it stores data
# based on what it calls the "Node Name", which defaults to the hostname.
# What this means for usage in Docker is that we should specify -h/--hostname
# explicitly for each daemon so that we don't get a random hostname and can
# keep track of our data
# Mapping the ports used to connect to send (5672) and to view in web (http://localhost:15672) - login using credentials in `default.cfg`
docker run -d --hostname tracey-dev-rabbit --name tracey-dev-rabbit -p 5672:5672 -p 15672:15672 rabbitmq:3.6.10-management-alpine

# Adding a 10000 to the port numbers on localhost compared to the containers inside
#docker run -d --name tracey-dev-neo4j --volume=$DATADIR/neo4j/data:/data --volume=$DATADIR/neo4j/logs:/logs -p 17474:7474 -p 17473:7473 -p 17687:7687 neo4j

echo "done, container created:"

docker ps --filter name=tracey*
