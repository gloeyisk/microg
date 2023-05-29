#!/system/bin/sh

#
# Collective Privileged Extensions by the
# open-source loving GL-DP and all contributors;
# Systemless installs collective privileged extensions (Aurora Services & F-Droid Privileged Extensions)
#

# Search inbuilt APK location (Aurora Services)
sleep 1
 ui_print "- Search inbuilt APK location"
sleep 1
 ui_print "  - Searching: Aurora Services"
for DIR in "/system/priv-app/AuroraServices" \
"/system/priv-app/AuroraStorePrivilegedExtension" \
"/system/product/priv-app/AuroraServices" \
"/system/product/priv-app/AuroraStorePrivilegedExtension"; do
if [ -d "$DIR" ]; then
AURORA="$DIR"
sleep 1
 ui_print "     APK found in: $DIR"
sleep 1
 ui_print "     Ignore installation for Aurora Services"
rm -r "$MODPATH$AuroraServices.apk"
rm -r "$MODPATH$privapp-permissions-com.aurora.services.xml"
break
fi
done
if [ -z "$AURORA" ]; then
sleep 1
 ui_print "     Inbuilt Aurora Service is not available"
sleep 1
 ui_print "     Continue installation"
APK=/system/priv-app
XML=/system/etc/permissions
mkdir -p $MODPATH$APK/AuroraServices $MODPATH$XML
mv -f $MODPATH/AuroraServices.apk $MODPATH$APK/AuroraServices
mv -f $MODPATH/privapp-permissions-com.aurora.services.xml $MODPATH$XML
fi

# Search inbuilt APK location (F-Droid Privileged Extension)
sleep 1
 ui_print "  - Searching: F-Droid Privileged Extension"
for DIR in "/system/priv-app/FDroidPrivilegedExtension" \
"/system/priv-app/F-DroidPrivilegedExtension" \
"/system/product/priv-app/FDroidPrivilegedExtension" \
"/system/product/priv-app/F-DroidPrivilegedExtension"; do
if [ -d "$DIR" ]; then
FDROID="$DIR"
sleep 1
 ui_print "     APK found in: $DIR"
sleep 1
 ui_print "     Ignore installation for F-Droid Privileged Extension"
rm -r "$MODPATH$F-DroidPrivilegedExtension.apk"
rm -r "$MODPATH$privapp-permissions-org.fdroid.fdroid.privileged.xml"
break
fi
done
if [ -z "$FDROID" ]; then
sleep 1
 ui_print "     Inbuilt F-Droid Privileged Extension is not available"
sleep 1
 ui_print "     Continue installation"
APK=/system/priv-app
XML=/system/etc/permissions
mkdir -p $MODPATH$APK/F-DroidPrivilegedExtension $MODPATH$XML
mv -f $MODPATH/F-DroidPrivilegedExtension.apk $MODPATH$APK/F-DroidPrivilegedExtension
mv -f $MODPATH/privapp-permissions-org.fdroid.fdroid.privileged.xml $MODPATH$XML
fi

# Clean up
sleep 1
 ui_print "- Cleaning up"
rm -rf $MODPATH/*.xml
rm -rf $MODPATH/*.apk

sleep 1
