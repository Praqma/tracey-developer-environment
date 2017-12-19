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


## Debugging messages

If you want to see messages processed by RabbitMQ you can bind a queue to the Tracey exchange.

1. Open [http://localhost:15672](http://localhost:15672)
1. go to the `Queues`-tab
1. Under `Add a new queue` fill out `name` to be `tracey-messages-debug` and click `Add queue`
1. Then click on the queue that shows up in the table above to open the queue
1. Go to the binding section `Add binding to this queue` and fill in the field `From exchange` to be `Tracey` (matching the exchange we send on). Then click `Bind`.


Then send messages, and you should see queued messages graph showing numbers.

To see the actual numbers, to the `Get messages` section on the same page you're on, and click `Get message(s)` and you have json.
