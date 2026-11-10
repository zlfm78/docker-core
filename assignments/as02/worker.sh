#!/bin/sh
# worker.sh
# Prints a job log every 2 seconds. Every 3rd job writes a warning to stderr.
# Handles SIGTERM and exits with code 0.

trap 'echo "SIGTERM received. Shutting down."; exit 0' TERM

echo "--- as02 worker started ---"
n=0
while true
do
  n=$((n + 1))
  if [ $((n % 3)) -eq 0 ]; then
    echo "job ${n}: retry scheduled" >&2
  else
    echo "job ${n}: done"
  fi
  sleep 2 &
  wait $!
done