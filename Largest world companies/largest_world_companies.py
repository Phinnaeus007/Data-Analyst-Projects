# largest_companies
from bs4 import BeautifulSoup
import requests
import pandas as pd
import re
# This script scrapes the Wikipedia page for the largest companies by revenue and saves the data to a CSV file.
# It uses BeautifulSoup for parsing HTML and requests for fetching the webpage.

#taking the url and getting the response
url = 'https://en.wikipedia.org/wiki/List_of_largest_companies_by_revenue'
response = requests.get(url)
soup = BeautifulSoup(response.text, 'html.parser')

#finding the table in the html page
table = soup.find_all('table', {'class': 'wikitable'})[0]

# Extract the titles from the table header
titles = table.find_all('th')
table_titles = []
for title in titles:
    table_titles.append(title.text.strip())
    if title.text.strip() == 'Headquarters[note 1]':
        break

#checking to see if it is working
print(table_titles)

# Extract the rank data from the table
rank_data= table.find_all('th')[10:70]
rank_table = []
for rank in rank_data:
    text = rank.text.strip()
    cleaned_text = re.sub(r"\n\d", '', text)
    cleaned_text = cleaned_text.replace('\n', '')
    rank_table.append(cleaned_text)
    
#bait was made dude the rank mismatch
bait = ''
rank_table.insert(0, bait)
print(rank_table)

df = pd.DataFrame(columns=table_titles)

# Extract rows from the table
column_data = table.find_all('tr')
vars = 0
for row in column_data[1:]:
    row_data = row.find_all('td')
    individual_data = []
    # Ensure vars does not exceed the length of rank_table
    if vars < len(rank_table):
        individual_data.append(rank_table[vars])
        vars += 1
    else:
        individual_data.append('N/A')  # Add a placeholder if rank_table is exhausted
    for data in row_data:
        # Append data until the length matches the number of columns
        if len(individual_data) < len(table_titles):
            individual_data.append(data.text.strip())
        else:
            break
    if len(individual_data) == len(table_titles):
        df.loc[len(df)] = individual_data
    else:
        print(f"Skipping row due to mismatch: {individual_data}")

    
print(df)

# Save the DataFrame to a CSV file
df.to_csv(r'C:\Users\HP\OneDrive\Desktop\appukuttus stuff\Data Science\Mysql\Data\largest_companies.csv', index=False)



