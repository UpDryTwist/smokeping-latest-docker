# smokeping-latest-docker
Build the standard SmokePing docker image from lscr.io/linuxserver/smokeping:latest, but include the latest Smokeping.pm.

In particular, doing this as needed the fixes in order to get authentication to work for InfluxDB v2x.
InfluxDB 2 authentication doesn't return a 401 error, so instead the credentials need to be in the header.
This is fixed in the latest Smokeping.pm, but is not in the packaged versions in the repos -- and thus doesn't
make it into the other packaged Docker versions.


