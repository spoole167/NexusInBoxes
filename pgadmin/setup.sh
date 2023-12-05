#!/bin/sh
echo "nexus config setup to ${PGADMIN_SERVER_JSON_FILE}"
echo "default admin ${PGADMIN_DEFAULT_EMAIL}"
echo "server count ${SERVER_COUNT}"
eval "CONFIG=${PGADMIN_SERVER_JSON_FILE}"

adminDir=$(echo "$PGADMIN_DEFAULT_EMAIL" | tr '@' '_')

mkdir -p /var/lib/pgadmin/storage/${adminDir}

echo "{ 'Servers': {" >  $CONFIG


for i in $(seq 1 $SERVER_COUNT)
do
  eval "hostkey=DB_$i"
  eval "host=\$$hostkey"
  eval "userkey=USER_$i"
  eval "user=\$$userkey"
  eval "passkey=PASSWORD_$i"
  eval "pass=\$$passkey"


  echo "$host:5432:*:$user:${pass}" > /var/lib/pgadmin/storage/${adminDir}/passfile${i}
  chmod 600 /var/lib/pgadmin/storage/${adminDir}/passfile${i}

if [ "$i" -gt 1 ]; then
    echo "," >>   $CONFIG
fi
  echo "'$i': {" >>   $CONFIG
  echo "'Name': '$host'," >>   $CONFIG
  echo "'Group': 'Sonatype'," >>   $CONFIG
  echo "'Host': '$host'," >>   $CONFIG
  echo "'Port': 5432," >>   $CONFIG
  echo "'MaintenanceDB': 'postgres'," >>   $CONFIG
  echo "'Username': '$user'," >>   $CONFIG
  echo "'KerberosAuthentication': false," >>   $CONFIG
  echo "'ConnectionParameters': {" >>   $CONFIG
  echo "'passfile': 'passfile${i}'" >>   $CONFIG
  echo "}}" >>   $CONFIG

done
  echo "}}" >>   $CONFIG

sed -i "s/'/\"/g" "$CONFIG"
cat $CONFIG


/entrypoint.sh
