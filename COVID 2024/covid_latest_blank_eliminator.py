
import pandas as pd
ref_file = r"C:\Users\HP\OneDrive\Desktop\covid_latest_copy.csv"
df = pd.read_csv(ref_file)
print(df)



blank_count = df.isna().sum()
print("Blank count in each column:")
print(blank_count.to_string())
blank_column = blank_count[blank_count > 0]


sql_statements= []
for column, count in blank_column.items():
    statement = f"""-- {column}

SELECT {column}
FROM covid_lates_copy
WHERE {column} = ''; -- {count} BLANKS

UPDATE covid_lates_copy
SET {column} = 0.00
WHERE {column} = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `{column}` DOUBLE;

"""
    sql_statements.append(statement)


sql_output = "\n".join(sql_statements)
print(sql_output)


output_path = r"C:\Users\HP\OneDrive\Desktop\appukuttus stuff\Data Science\Mysql\SQL files\gpt_edit.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_output)


