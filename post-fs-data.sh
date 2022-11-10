#!/system/bin/sh

MODDIR=${0%/*}

SUPL_HOST=supl.vodafone.com #default: SUPL_HOST=supl.google.com
NTP_SERVER=pool.ntp.org #default: NTP_SERVER=time.xtracloud.net

# For new "Treble enabled" devices (>Android 8?). REF: https://source.android.com/devices/architecture
# Oneplus 7T PRO is treble enabled: getprop ro.treble.enabled #prints true
if [ -f /system/vendor/etc/gps.conf ]; then
  # cp /system/vendor/etc/gps.conf "${MODDIR}/system/vendor/etc/gps.conf"
  # sed -i "s/^SUPL_HOST=.*/SUPL_HOST=${SUPL_HOST}/" "${MODDIR}/system/vendor/etc/gps.conf"
  # sed -i "s/^NTP_SERVER=.*/NTP_SERVER=${NTP_SERVER}/" "${MODDIR}/system/vendor/etc/gps.conf"
  if [ -f "${MODDIR}/system/vendor/etc/.gitkeep" ]; then
    rm "${MODDIR}/system/vendor/etc/.gitkeep"
  fi
else
  if [ -f "${MODDIR}/system/vendor/etc/.gitkeep" ]; then
    rm "${MODDIR}/system/vendor/etc/.gitkeep"
  fi
  rmdir "${MODDIR}/system/vendor/etc" && rmdir "${MODDIR}/system/vendor"
fi



# For older devices # to comment/remove?
if [ -f /system/etc/gps.conf ]; then
  cp /system/etc/gps.conf "${MODDIR}/system/etc/gps.conf"
  sed -i "s/^SUPL_HOST=.*/SUPL_HOST=${SUPL_HOST}/" "${MODDIR}/system/etc/gps.conf"
  sed -i "s/^NTP_SERVER=.*/NTP_SERVER=${NTP_SERVER}/" "${MODDIR}/system/etc/gps.conf"
  if [ -f "${MODDIR}/system/etc/.gitkeep" ]; then
    rm "${MODDIR}/system/etc/.gitkeep"
  fi
else
  if [ -f "${MODDIR}/system/etc/.gitkeep" ]; then
    rm "${MODDIR}/system/etc/.gitkeep"
  fi
  rmdir "${MODDIR}/system/etc"
fi
