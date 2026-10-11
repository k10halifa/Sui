#!/system/bin/sh

LOG_FILE=/data/local/tmp/sui_debug.log

log_debug() {
  printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*" >> "$LOG_FILE" 2>/dev/null
}

log_debug "service.sh: late_start service hook started"
sleep 5

if pid="$(pidof sui 2>/dev/null)" && [ -n "$pid" ]; then
  log_debug "service.sh: Sui system service is running (PID: $pid)"
else
  log_debug "service.sh: Sui system service was not found"
fi
