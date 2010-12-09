#!/bin/bash
# Usage: mssh.sh "machine1 [machine2...]" "command"

OUTPUT_LOG=/tmp/output-$$.log
ERROR_LOG=/tmp/error-$$.log
MACHINES=$1; shift
COMMAND=$1; shift

for machine in $MACHINES
do
    echo $machine >>$OUTPUT_LOG.$machine
    ssh $machine $COMMAND >>$OUTPUT_LOG.$machine 2>>$ERROR_LOG.$machine &
done

wait

cat $OUTPUT_LOG.*
cat $ERROR_LOG.* >&2
rm -f $OUTPUT_LOG.* $ERROR_LOG.*
