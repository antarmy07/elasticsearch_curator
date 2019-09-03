# elasticsearch_curator

This repo helps anyone using local elasticsearch to remove and clean indices that are older than 90 days. 


Download and install the Public Signing Key:

```
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo deb http://packages.elastic.co/curator/4/debian stable main >> /etc/apt/sources.list.d/curator.list

sudo apt-get update && sudo apt-get install elasticsearch-curator

```
# create script to clean indice older than 90days

Open termincal and create script file and modify the file to execute

```
touch CleanIndices.sh
chmod +x CleanIndice.sh
```

Copy paste the the script below to the new file.

```
curator_cli --host localhost --port 9200 delete_indices --filter_list '[{"filtertype": "age", "source": "creation_date", "direction": "older", "unit": "days", "unit_count":90}]'

```
Add the script to the cron job to run on the scheduled time

```
crontab -e

0 0 1 * * sh /home/ubuntu/DevOps/CleanIndices.sh

etc/init.d/cron start

```
