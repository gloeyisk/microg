#!/system/bin/sh

#
# Modified Play Store by the
# open source loving GL-DP and all contributors;
# Systemless installs modified Play Store to allow (in-)app-purchases with microG
#

# Checking for installation environment
if [ $BOOTMODE = true ]; then
 ROOT=$(find `magisk --path` -type d -name "mirror" | head -n 1)
	ui_print "- Root path: $ROOT"
else
 ROOT=""
fi

# Install APK as system apps (replaces FakeStore APK)
REPLACE="
/system/product/priv-app/FakeStore
"
APK=/system/priv-app
  ui_print "- Installing APK files"
mkdir -p $MODPATH$APK/Phonesky
mv -f $MODPATH/Phonesky.apk $MODPATH$APK/Phonesky
  ui_print "- Patching APK files"
mkdir -p $MODPATH$APK/Phonesky
mv -f $MODPATH/patches/* $MODPATH$APK/Phonesky

# Configure core files
PATCH1=/system/etc
PATCH2=/system/framework
PATCH3=/system/bin
  ui_print "- Configuring core files"
mkdir -p $MODPATH$PATCH1 $MODPATH$PATCH2 $MODPATH$PATCH3
mv -f $MODPATH/etc/* $MODPATH$PATCH1
mv -f $MODPATH/framework/* $MODPATH$PATCH2
mv -f $MODPATH/npem $MODPATH$PATCH3

# Clean up
rm -rf $MODPATH/*.apk
rm -rf $MODPATH/etc
rm -rf $MODPATH/framework
rm -rf $MODPATH/npem
rm -rf $MODPATH/patches
