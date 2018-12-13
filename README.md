# esrally on OKD

Benchmark Elasticsearch cluster(s) on OKD (OpenShift).

# Run as docker
```
docker run -ti zenlab/esrally
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
```

# More info

See [https://github.com/elastic/rally](https://github.com/elastic/rally) or [https://esrally.readthedocs.io](https://esrally.readthedocs.io) more details regarding Rally and Elasticsearch benchmarks.
