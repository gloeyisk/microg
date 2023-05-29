#!/system/bin/sh

#
# Modified Play Store by the
# open-source loving GL-DP and all contributors;
# Systemless installs modified Play Store to allow (in-)app-purchases with microG
#

# Search inbuilt APK location (FakeStore)
sleep 1
for DIR in "/system/priv-app/FakeStore" \
"/system/product/priv-app/FakeStore"; do
if [ -d "$DIR" ]; then
FS="$DIR"
break
fi
done
if [ -z "$FS" ]; then
sleep 1
 ui_print "  Inbuilt FakeStore is not available"
sleep 1
 ui_print "  This module is mainly for microG! Aborting!"
exit 1
fi

# Install APK as system apps
APK=/system/priv-app
sleep 1
 ui_print "- Installing Play Store"
mkdir -p $MODPATH$APK/Phonesky
mv -f $MODPATH/Phonesky.apk $MODPATH$APK/Phonesky

# Configure core files
PATCH1=/system/etc
PATCH2=/system/framework
PATCH3=/system/product/microGSuiteOverlay
sleep 1
 ui_print "- Configuring core files"
mkdir -p $MODPATH$PATCH1 $MODPATH$PATCH2 $MODPATH$PATCH3
mv -f $MODPATH/etc/* $MODPATH$PATCH1
mv -f $MODPATH/framework/* $MODPATH$PATCH2
mv -f $MODPATH/microGSuiteOverlay.apk $MODPATH$PATCH3

# Clean up
sleep 1
 ui_print "- Cleaning up"
rm -rf $MODPATH/*.apk
rm -rf $MODPATH/etc
rm -rf $MODPATH/framework
rm -rf $MODPATH/patches
rm -rf $MODPATH/Phonesky

sleep 1
