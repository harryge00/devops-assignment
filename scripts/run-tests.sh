#!/bin/bash
sleep 5
docker ps
curl localhost:8001/health/live
curl localhost:8002/health/live
curl localhost:8001/airports/NL
curl localhost:8002/countries/Netherlands
