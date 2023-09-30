#!/bin/bash

echo "CREATING JOB...   "
echo "DAST API HOST =>   $DAST_API_HOST"
echo "DAST USERNAME =>   $DAST_USERNAME"
echo "DAST PASSWORD =>   $DAST_PASSWORD"
echo "DAST CICD TOKEN => $DAST_CICD_TOKEN"
echo "DAST JOB NAME =>   $DAST_JOB_NAME"

echo "TRIGGERING DAST SCAN API...   "
echo "AUTHENTICATING...   "
AUTH_RESP=$(curl -X 'POST' -s --insecure "$DAST_API_HOST/api/v2/auth" -H 'accept:text/plain' -H 'Content-Type:application/json-patch+json' -d "{'username':'$DAST_USERNAME', 'password':'$DAST_PASSWORD'}")
echo "AUTHENTICATION RESPONSE =>   $AUTH_RESP"
echo "STARTING TOKEN EXTRACTION FROM AUTH RESP...   "

FFTOKEN=$(echo $AUTH_RESP | grep -o '"token":"FORTIFYTOKEN [^"]\+' | cut -d '"' -f 4)
echo "SCAN TOKEN =>   $FFTOKEN"
echo "STARTING SCANNING...   "

SCAN_RESP=$(curl -X 'POST' -s --insecure "$DAST_API_HOST/api/v2/scans/start-scan-cicd" -H 'accept:text/plain' -H "Authorization:$FFTOKEN" -H 'Content-Type:application/json-patch+json' -d "{'cicdToken':'$DAST_CICD_TOKEN','name':'$DAST_JOB_NAME','scannerId':0,'useAssignedScannerOnly':true,'overrides':{'dataRetentionDays':0,'scanPriority':5,'scanMode':2}}")
echo "SCAN RESPONSE =>   $SCAN_RESP"
echo "DONE!"
