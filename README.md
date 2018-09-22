# devops-assignment ![CI status](https://travis-ci.org/harryge00/devops-assignment.svg?branch=master)


## Commands
* Start the entire stack by `make`
* Update airports service from v1.0.1 to v1.1.0: `make upgrade-airports`
* Clean the entire stack by `make clean`

## Explanation
* First of all, we need two `docker network`. `airports-assembly` and `countries-assembly` should be in two different network so they are isolated from each other.

* Reverse-proxy can be achieved by `nginx`, which connects to both `docker network`.

* Expose health-checks as
```
/airports/health/live
/airports/health/ready
/countries/health/live
/countries/health/ready
```

* Travis CI is used for CI/CD. Config file: `.travis.yml`, which will run `java -jar` in two containers. Then `./scripts/run-test.sh` is run for simple tests.

* Airport service is updated by change `nginx.conf` and dynamically reload nginx config.