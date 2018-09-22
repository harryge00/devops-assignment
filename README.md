# devops-assignment

* First of all, we need two `docker network`. `airports-assembly` and `countries-assembly` should be in two different network so they are isolated from each other.

* Reverse-proxy can be achieved by `nginx`, which connects to both `docker network`.

* Expose health-checks as
```
/airports/health/live
/airports/health/ready
/countries/health/live
/countries/health/ready
```