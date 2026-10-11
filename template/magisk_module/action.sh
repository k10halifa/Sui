#!/system/bin/sh

LOG_FILE=/data/local/tmp/sui_debug.log
SUI_SHORTCUT_EXTRA=rikka.sui.extra.SUI

if pid="$(pidof sui 2>/dev/null)" && [ -n "$pid" ]; then
  printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "action.sh: Sui system service is running (PID: $pid)" >> "$LOG_FILE" 2>/dev/null
else
  printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "action.sh: Sui system service is not running; attempting to launch UI anyway" >> "$LOG_FILE" 2>/dev/null
fi

echo "Launching Sui UI..."
if launch_output="$(am start -a android.settings.APPLICATION_DEVELOPMENT_SETTINGS \
  -p com.android.settings --ei "$SUI_SHORTCUT_EXTRA" 1 2>&1)"; then
  printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "action.sh: $launch_output" >> "$LOG_FILE" 2>/dev/null
  echo "$launch_output"
else
  printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "action.sh: failed to launch Sui UI: $launch_output" >> "$LOG_FILE" 2>/dev/null
  echo "Failed to launch Sui UI; see $LOG_FILE"
  exit 1
fi
