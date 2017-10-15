# LOGSTASH CONFIG

The configurations files in this dir are a combination from what can be found in
a the official docker image for logstash `5.6.3` and from what we can found when
installing logstash with `apt-get install logstash` in the official docker image
for java.

This files have been extracted from their origins in 14 Oct 2017 and maid
available here to serve as a quick reference for what we can tune/override.

#### Original Locations

* Logstash image - `/usr/share/logstash/config`
* Java image - `/etc/logstash`


## Disclaimer

The settings available to configure in this files are not an exhaustive list of
all available, just the ones shipped by default.

Please refer to the [official Logstash documentation](https://www.elastic.co/guide/en/logstash/current/index.html) for more details.
