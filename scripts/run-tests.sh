#!/bin/bash
echo "Testing airports-assembly"
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:8001/health/ready)" != "200" ]]; do 
	echo "Airports service still initializing...Wait 5s"
	sleep 5; 
done
curl localhost:8001/airports/NL

echo "Testing countries-assembly"
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:8002/health/ready)" != "200" ]]; do
	echo "Countries service still initializing...Wait 5s"
 	sleep 5;
done
curl localhost:8002/countries/Netherlands
