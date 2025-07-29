import pandas as pd
from sqlalchemy import create_engine

#Read the data into a data frame
df = pd.read_csv("/Users/uzairahmed/Downloads/retail_sales_dataset.csv")

#Initialize an empty list to store cleaned column names
cleaned_columns = []

#Loop through each column name in original data 
for col in df.columns:
    #Changing title to lowercase and replacing space with _
    new_col = col.lower().replace(" ", "_")
    #Renaming date column to avoid issues in SQL
    if new_col == "date":
        new_col = "transaction_date"
    #Adding updated titles to the empty list
    cleaned_columns.append(new_col)

#Renaming date column to avoid issues in SQL
df.rename(columns={"date": "transaction_date"}, inplace=True)

#Assigning the cleaned column names to the original data frame
df.columns = cleaned_columns

#Save the cleaned data to a csv file
df.to_csv("retail_sales_cleaned.csv", index=False)

#Define PostgreSQL login credentials
user = "postgres"
password = "hyderabad28"
host = "localhost"
port = "5432"
database = "postgres"

engine = create_engine(f"postgresql://{user}:{password}@{host}:{port}/{database}")

df.to_sql("sales", engine, if_exists="append", index=False)
