# TROUBLESHOOTING KIBANA


## Login

### Login Disabled - Unable to determine license

#### The Error

When trying to access Kibana for the first time we are redirected to the login
page, but login fields are disabled and big red alert is displayed below with an
error message.

##### Error message:

```
Login is currently disabled because the license could not be determined.
Please check that Elasticsearch has the X-Pack plugin installed and is reachable, then refresh this page.
```

#### The Cause

As per [this Stackoverflow reply](https://stackoverflow.com/a/28025994) this can
happen because we reached the disk space threshold from where Elasticsearch will
not allocate more shards to the node.


#### The Solution

##### Settings:

```
cluster.routing.allocation.disk.watermark.low=2gb
cluster.routing.allocation.disk.watermark.high=1gb
```

This must be added in docker compose environment section or in elasticsearch yml configuration file.

More details on this settings can be found in [this ElasticSearch docs](https://www.elastic.co/guide/en/elasticsearch/reference/current/disk-allocator.html).
