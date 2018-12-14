# esrally on OKD

Benchmark Elasticsearch clusters on OKD.

## Run as Docker

A config file (really.ini) is required to run esrally and an example configuration file is available in ./exmaples

Clone and prep:
```
git clone https://github.com/zenaptix-lab/esrally.git
cd esrally
mkdir .rally
```

Configure esrally:
```
docker run -ti -v ${PWD}/.rally:/root/.rally quay.io/zenlab/esrally configure
```

Run as docker:
```
docker run -ti -v ${PWD}/.rally:/root/.rally race --track=percolator --target-host=<elasticsearch>:9200 --pipeline=benchmark-only
```

## Run as OKD job

Create configmaps:
```
oc create -f esrally-cm.yaml
```

Create template and create new-app:
```
oc create -f esrally.yaml
oc new-app esrally
```

Specify different track:
```
oc new-app esrally -p TRACK=pmc
```

Destroy:
```
oc process esrally | oc delete -f -
oc delete -f esrally-cm
```

## Image registry

[https://quay.io/repository/zenlab/esrally](https://quay.io/repository/zenlab/esrally)

## Logging

Logging configured to log everything to STDOUT.

## Persistent storage

Rally template (esrally.yaml) is configured to use persistent storage from the default OKD storageClass. Alternatively use rally-ephemeral.yaml for ephemeral storage.

# More info

See [https://github.com/elastic/rally](https://github.com/elastic/rally) or [https://esrally.readthedocs.io](https://esrally.readthedocs.io) for more details regarding Rally and Elasticsearch benchmarks.
