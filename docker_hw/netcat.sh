#! /bin/sh

PORT=8888
CUR_CONTAINER="$CONTAINER_NAME"

if [ "$CUR_CONTAINER" = "server" ] ; then
	echo "Hello from $CUR_CONTAINER. Will listen on port $PORT"
	set -x
	nc -l -p $PORT
elif [ "$CUR_CONTAINER" = "client" ]; then
	echo "HELLO FROM $CUR_CONTAINER. Will connect to server trough port $PORT"
	set -x
	nc server $PORT
else
	echo "Error: unknown container name. Check env variable '$CONTAINER_NAME. Only values 'server' and 'client' are acceptable"
fi
