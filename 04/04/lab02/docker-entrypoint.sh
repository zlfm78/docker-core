#!/bin/sh
echo "[ENTRYPOINT] Initialize ......"
echo "[ENTRYPOINT] Main Process Run: $* "

exec "$@"