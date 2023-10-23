#!/bin/bash
# Wrapper for dbgen - workaround missing dists.dss input file
# Will generate some data from the given args into the output dir (/data) which is normally an external volume
# Def: -s 1 -T a (all tables, one partition)
ARGS="$@"
if [ "$ARGS" = "" ]; then
  ARGS="-s 1 -T a"
fi

mkdir -p /data/ # It should be mounted externally though

# We need to copy dists.dss onto the output directory
cp /bin/dists.dss /data/
cd /data

# RUN - with -f imposed as files will be overwritten
/bin/dbgen -f $ARGS