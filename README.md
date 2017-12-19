# tracey-developer-environment
A simple setup to start an Tracey Eiffel infrastructure to help developers work and demo our project.

Supports only MAC/Linux Bash Shell.

## Start toolstack

You can start the toolstack, currently RabbitMQ for our development with:

    ./start-dev-stack.sh

That will start a container, you can connect on the web UI on: [http://localhost:15672](http://localhost:15672)

Credentials can be found in `send-events/default.cfg` file.


## Send events script and json templates

In the the `send-events` folder find a little script that can send event to the RabbitMQ queue.

Go to the folder, to send a few events by just running:

    sayAll

It uses `scc.json` and `scs.json` and some jar-files you need to download here first by running `download-cli-tools.sh`

For send configuration it uses the `default.cfg` file for host of the RabbitMQ.

Uses port `5682` send on, see `default.cfg` file
