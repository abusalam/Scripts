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
