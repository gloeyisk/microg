#!/system/bin/sh

# Wait for bootup
while true; do [ "$(getprop sys.boot_completed)" = "1" ] && break; sleep 5; done;

# Grant permissions
npem;
