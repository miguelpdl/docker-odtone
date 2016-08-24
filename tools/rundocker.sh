#!/bin/bash

# Give meaningful name to the container
NAME_CON=odtone-80221

# Run the main asterisk container.
docker run \
    --name $NAME_CON \
    -v $(pwd):/tmp/$NAME_CON/ \
    --net=host \
    -d -t odtone/80221
