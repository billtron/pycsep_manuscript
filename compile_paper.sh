#! /bin/bash

rm paper.pdf 
docker run --rm \
    --volume $PWD:/data \
    --user $(id -u):$(id -g) \
    --env JOURNAL=joss \
    openjournals/paperdraft && \
open -a Preview paper.pdf

