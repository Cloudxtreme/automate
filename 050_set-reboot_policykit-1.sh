#/usr/share/polkit-1/
#
#actions
#
#<?xml version="1.0" encoding="UTF-8"?>
#<!DOCTYPE policyconfig PUBLIC "-//freedesktop//DTD polkit Policy Configuration 1.0//EN"
#"http://www.freedesktop.org/software/polkit/policyconfig-1.dtd">
#
#<policyconfig>
#
#  <action id="org.freedesktop.consolekit.system.stop-multiple-users">
#    <description>Stop the system when multiple users are logged in</description>
#    <message>System policy prevents stopping the system when other users are logged in</message>
#    <defaults>
#      <allow_inactive>no</allow_inactive>
#      <allow_active>auth_admin_keep</allow_active>
#    </defaults>
#  </action>
#
#  <action id="org.freedesktop.consolekit.system.restart-multiple-users">
#    <description>Restart the system when multiple users are logged in</description>
#    <message>System policy prevents restarting the system when other users are logged in</message>
#    <defaults>
#      <allow_inactive>no</allow_inactive>
#      <allow_active>auth_admin_keep</allow_active>
#    </defaults>
#  </action>
#
#</policyconfig>
#
# to:
#
#<?xml version="1.0" encoding="UTF-8"?>
#<!DOCTYPE policyconfig PUBLIC "-//freedesktop//DTD polkit Policy Configuration 1.0//EN"
#"http://www.freedesktop.org/software/polkit/policyconfig-1.dtd">
#
#<policyconfig>
#
#  <action id="org.freedesktop.consolekit.system.stop-multiple-users">
#    <description>Stop the system when multiple users are logged in</description>
#    <message>System policy prevents stopping the system when other users are logged in</message>
#    <defaults>
#      <allow_inactive>no</allow_inactive>
#      <allow_active>yes</allow_active>
#    </defaults>
#  </action>
#
#  <action id="org.freedesktop.consolekit.system.restart-multiple-users">
#    <description>Restart the system when multiple users are logged in</description>
#    <message>System policy prevents restarting the system when other users are logged in</message>
#    <defaults>
#      <allow_inactive>no</allow_inactive>
#      <allow_active>yes</allow_active>
#    </defaults>
#  </action>
#
#</policyconfig>


apt-get install xmlstarlet
POLKIT_HOME=/usr/share/polkit-1

# org.freedesktop.consolekit.system.stop yes
# org.freedesktop.consolekit.system.stop-multiple-users auth_admin_keep
# org.freedesktop.consolekit.system.restart yes
# org.freedesktop.consolekit.system.restart-multiple-users auth_admin_keep

# Default
SYSTEM_STOP='yes'
SYSTEM_STOP_MULTI='auth_admin_keep'
SYSTEM_RESTART='yes'
SYSTEM_RESTART_MULTI='auth_admin_keep'

# Single
SYSTEM_STOP='yes'
SYSTEM_STOP_MULTI='yes'
SYSTEM_RESTART='yes'
SYSTEM_RESTART_MULTI='yes'

xmlstarlet edit -L -u "/policyconfig/action[@id='org.freedesktop.consolekit.system.stop']"/defaults/allow_active -v ${SYSTEM_STOP} ${POLKIT_HOME}/actions/org.freedesktop.consolekit.policy

xmlstarlet edit -L -u "/policyconfig/action[@id='org.freedesktop.consolekit.system.stop-multiple-users']"/defaults/allow_active -v ${SYSTEM_STOP_MULTI} ${POLKIT_HOME}/actions/org.freedesktop.consolekit.policy

xmlstarlet edit -L -u "/policyconfig/action[@id='org.freedesktop.consolekit.system.restart']/defaults/allow_active -v ${SYSTEM_RESTART} ${POLKIT_HOME}/actions/org.freedesktop.consolekit.policy

xmlstarlet edit -L -u "/policyconfig/action[@id='org.freedesktop.consolekit.system.restart-multiple-users']"/defaults/allow_active -v ${SYSTEM_RESTART_MULTI} ${POLKIT_HOME}/actions/org.freedesktop.consolekit.policy

