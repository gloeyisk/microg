#!/system/bin/sh

#
# Collective Privileged Extensions by the
# open source loving GL-DP and all contributors;
# Systemless installs collective privileged extensions (Aurora Services & F-Droid Privileged Extensions)
#

# Checking for installation environment
if [ $BOOTMODE = true ]; then
 ROOT=$(find `magisk --path` -type d -name "mirror" | head -n 1)
	ui_print "- Root path: $ROOT"
else
 ROOT=""
fi

# Install APK as system apps
APK=/system/priv-app
  ui_print "- Installing APK files"
mkdir -p $MODPATH$APK/AuroraServices $MODPATH$APK/F-DroidPrivilegedExtension
mv -f $MODPATH/AuroraServices.apk $MODPATH$APK/AuroraServices
mv -f $MODPATH/F-DroidPrivilegedExtension.apk $MODPATH$APK/F-DroidPrivilegedExtension

# Configure XML files
XML=/system/etc/permissions
  ui_print "- Configuring XMLs files"
mkdir -p $MODPATH$XML
mv -f $MODPATH/*.xml $MODPATH$XML

# Clean up
  ui_print "- Cleaning up"
rm -rf $MODPATH/*.xml
rm -rf $MODPATH/*.apk
