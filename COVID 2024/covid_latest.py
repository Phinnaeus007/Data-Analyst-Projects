
from pprint import pprint
import os
import json

import pandas as pd
json_data = json.loads(open('covid_latest.json').read())
pprint(json_data)
all_keys = set()
for v in json_data.values():
    all_keys.update(v.keys())
print(len(all_keys), all_keys)

df = pd.DataFrame.from_dict(json_data, orient='index')
df = df.reindex(columns=all_keys)
print(df)
df.to_csv(r'C:\Users\HP\OneDrive\Desktop\appukuttus stuff\Data Science\Mysql\Data\covid_latest.csv')


