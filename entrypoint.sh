#!/usr/bin/env bash
set -e
MC_RTC_WORKSPCE=/mc_rtc_ws
bash ${MC_RTC_WORKSPCE}/install/share/hrpsys/samples/JVRC1/clear-omninames.sh

exec "$@"
