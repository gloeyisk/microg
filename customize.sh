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

# Search APK location (Aurora Service)
  ui_print "- Search default APK location"
  ui_print "  - Searching: Aurora Service"
for DIR in "/system/priv-app/AuroraServices" \
           "/system/priv-app/AuroraStorePrivilegedExtension" \
           "/system/product/priv-app/AuroraServices" \
           "/system/product/priv-app/AuroraStorePrivilegedExtension"; do
if [ -d "$DIR" ]; then
AUR="$DIR"
  ui_print "    APK found in: $DIR"
break
fi
done
if [ -z "$AUR" ]; then
  ui_print "  Prebuilt Aurora Service is not available"
  ui_print "  Continue installation"
fi

# Search APK location (F-Droid Privileged Extension)
  ui_print "  - Searching: F-Droid Privileged Extension"

for DIR in "/system/priv-app/FDroidPrivilegedExtension" \
           "/system/priv-app/F-DroidPrivilegedExtension" \
           "/system/product/priv-app/FDroidPrivilegedExtension" \
           "/system/product/priv-app/F-DroidPrivilegedExtension"; do
if [ -d "$DIR" ]; then
FDR="$DIR"
  ui_print "    APK found in: $DIR"
break
fi
done
if [ -z "$FDR" ]; then
  ui_print "  Prebuilt F-Droid Privileged Extension is not available"
  ui_print "  Continue installation"
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
rm -rf $MODPATH/*.xml
rm -rf $MODPATH/*.apk
