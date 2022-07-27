#!/bin/sh

# run redis in the detachment mode
# reference: https://stackoverflow.com/questions/14816892/how-to-keep-redis-server-running
redis-server --daemonize yes

# Run the hello
python hello.py