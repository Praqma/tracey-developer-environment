#!/bin/bash

echo "This script will download the jar files we need to to send messages from Github Releases"


# Find the dir of this file and use that as destination for the download:
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR && wget https://github.com/Praqma/tracey-cli-rabbitmq/releases/download/1.2.2/tracey-cli-rabbitmq.jar
