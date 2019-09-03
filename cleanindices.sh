curator_cli --host localhost --port 9200 delete_indices --filter_list '[{"filtertype": "age", "source": "creation_date", "direction": "older", "unit": "days", "unit_count":90}]'
