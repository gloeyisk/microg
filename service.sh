#
# Build Fingerprint Changer by the
# open-source loving GL-DP and all contributors;
# Override current ROM build fingerprint in order to bypass SafetyNet Basic & CTS check on microG
#

# Wait until boot completed
while [ "$(getprop sys.boot_completed)" != "1" ]
do
sleep 1
done
