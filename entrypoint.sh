#!/usr/bin/env bash
set -e

bash /workspace/install/share/hrpsys/samples/JVRC1/clear-omninames.sh

exec "$@"
