# Monitor Server Load

Simple shell script to monitor server load.

## Table of Contents

  1. [Monitor Load of Web Server and DB Server with CPU and RAM Usage](docs/load-monitor.md)

## Scheduling cron job

Make the shell script [load-monitor.sh](../load-monitor.sh) executable

```bash
$ chmod a+x load-monitor.sh
```

Then run the shell script 

```bash
$ ./load-monitor.sh
```
On a single core system, a load average of 0.4 means the system is doing only 40% of work it can do. A load average of 1 means that the system is exactly at capacity — the system will be overloaded by adding even a little bit of additional work. A system with a load average of 2.12 means that it is overloaded by 112% more work than it can handle.

On a multi-core system, you should first divide the load average with the number of CPU cores to get a similar measure.

## Scheduling cron job

Make the shell script [serverstatus](../serverstatus) executable

```bash
$ chmod a+x serverstatus
```

create a cron job

```bash
$ crontab -e
```

Then add the following line:

```bash
*/5 * * * * ~/serverstatus >> server-load.log
```

It should log server load every 5 mins.
