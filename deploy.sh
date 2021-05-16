#!/bin/sh
export pod_upgrade_body=$(curl -k -s "https://rancher.local.lan/v3/project/c-gkxrv:p-4knfm/workloads/deployment:chat:chat" -X GET -H "Authorization: Bearer $CATTLE_ACCESS_KEY:$CATTLE_SECRET_KEY" -H 'content-type: application/json' -H 'accept: application/json' 2>&1 | sed  "s/\"cattle\.io\/timestamp\"\:\"[0-9T:Z-]*\"/\"cattle\.io\/timestamp\":\"$(date -u +"%Y-%m-%dT%H:%M:%SZ")\"/g")
curl -k "https://rancher.local.lan/v3/project/c-gkxrv:p-4knfm/workloads/deployment:chat:chat" -X PUT -H "Authorization: Bearer $CATTLE_ACCESS_KEY:$CATTLE_SECRET_KEY" -H 'Accept-Encoding: gzip, deflate, br' -H 'Connection: keep-alive' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'content-type: application/json' -H 'accept: application/json' --data-binary "$pod_upgrade_body" --compressed