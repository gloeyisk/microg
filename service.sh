#
# Modified Play Store by the
# open source loving GL-DP and all contributors;
# Systemless installs modified Play Store to allow (in-)app-purchases with microG
#

# Wait until boot completed
while [ "$(getprop sys.boot_completed)" != "1" ]
do
sleep 5
done
