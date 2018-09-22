#!/bin/bash
curl localhost:8000/airports/health/live
curl localhost:8000/airports/health/ready
curl localhost:8000/countries/health/live
curl localhost:8000/countries/health/ready
