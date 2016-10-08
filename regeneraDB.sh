#! /bin/bash
# regenerar la BD de slapd.d
# $1 fitxer de configuracio a usar

systemctl stop slapd
rm -rf /var/lib/ldap/*
cp /usr/share/openldap-servers/DB_CONFIG.example    /var/lib/ldap/DB_CONFIG
rm -rf /etc/openldap/slapd.d/*
slaptest -v -f $1 
slaptest -v -f $1 -F /etc/openldap/slapd.d
slaptest -v -F /etc/openldap/slapd.d
chown -R ldap.ldap /var/lib/ldap*
chown -R ldap.ldap /etc/openldap/slapd.d/*
systemctl start slapd
#slapcat -n0 |less
echo "REGENERACION CORRECTA"
