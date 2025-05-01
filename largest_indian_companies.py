
#forbes scraper india
from bs4 import BeautifulSoup
import requests
url = 'https://en.wikipedia.org/wiki/List_of_largest_companies_in_India'
page = requests.get(url)
soup = BeautifulSoup(page.text, 'html')
table = soup.find_all('table', {'class': 'wikitable'})[0]
forbes_titles = table.find_all('th')
forbes_table_titles = [ titles.text.strip() for titles in forbes_titles ]
print(forbes_table_titles)
import pandas as pd
df = pd.DataFrame(columns=forbes_table_titles)
column_data = table.find_all('tr')
for row in column_data[1:]:
    row_data = row.find_all('td')
    induvidual_row_data = [data.text.strip() for data in row_data]
    length = len(df)
    df.loc[length] = induvidual_row_data
print(df)
df.to_csv(r'C:\Users\HP\OneDrive\Desktop\appukuttus stuff\Data Science\Mysql\Data\forbes.csv', index=False)


