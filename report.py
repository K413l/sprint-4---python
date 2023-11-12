import oracledb
import csv
from datetime import datetime

connection = oracledb.connect(user = 'RM551007',password = '030803',dsn = 'oracle.fiap.com.br/orcl') 

cursor = connection.cursor()
table =  input("Qual tabela deseja selecionar: ")
query = f"SELECT * FROM {table}"
cursor.execute(query)

#date = datetime.now().strftime("%d/%m/%Y_%H:%M:%S")
date = datetime.now().strftime("%d%m%Y")
#nomereport = str(f'report_{table}_{date}.csv')
nomereport = str(f'report_{table}_{date}.csv')

with open(str(nomereport), 'w', newline='') as csvfile:
    csv_writer = csv.writer(csvfile)
    csv_writer.writerow([col[0] for col in cursor.description])  # Write column headers

    for row in cursor:
        csv_writer.writerow(row)

cursor.close()
connection.close()
