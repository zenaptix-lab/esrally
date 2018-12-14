# esrally on OKD

Benchmark Elasticsearch clusters on OKD.

## Logging

Logging configured to log everything to STDOUT.

# Running as docker

A config file (really.ini) is required to run esrally and an example configuration file is available in ./exmaples

Clone and prep:
```
git clone https://github.com/zenaptix-lab/esrally.git
cd esrally
mkdir .rally
```

Configure esrally
```
docker run -ti -v ${PWD}/.rally:/root/.rally quay.io/zenlab/esrally configure
```

Run as docker
```
docker run -ti -v ${PWD}/.rally:/root/.rally race --track=percolator --target-host=<elasticsearch>:9200 --pipeline=benchmark-only
```

# Runs as OKD/k8s job

Create configmaps:
```
oc create -f esrally-cm.yaml
```

Create template and create new-app:
```
oc create -f esrally.yaml
oc new-app esrally
```

# Specify different track in OKD/k8s
```
oc new-app esrally -p TRACK=pmc
```

# Destroy
```
oc process esrally | oc delete -f -
oc delete -f esrally-cm
```

# More info

See [https://github.com/elastic/rally](https://github.com/elastic/rally) or [https://esrally.readthedocs.io](https://esrally.readthedocs.io) more details regarding Rally and Elasticsearch benchmarks.
