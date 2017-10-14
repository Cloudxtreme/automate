# To enable audit/rules.d

sed -i 's,^\(USE_AUGENRULES=\).*,\1'\"yes\"',' /etc/default/auditd

