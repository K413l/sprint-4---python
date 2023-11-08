import oracledb
import csv

# Replace these values with your Oracle database connection details
connection = oracledb.connect(user = 'RM550620',password = '130400',dsn = 'oracle.fiap.com.br/orcl') 

cursor = connection.cursor()
table =  input("Qual tabela deseja selecionar")
query = f"SELECT * FROM {table}"
cursor.execute(query)

with open('report.csv', 'w', newline='') as csvfile:
    csv_writer = csv.writer(csvfile)
    csv_writer.writerow([col[0] for col in cursor.description])  # Write column headers

    for row in cursor:
        csv_writer.writerow(row)

cursor.close()
connection.close()
