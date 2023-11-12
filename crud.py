import oracledb
import csv

connection = oracledb.connect(user = 'RM551007',password = '030803',dsn = 'oracle.fiap.com.br/orcl') 
cursor = connection.cursor()

def listar_colunas():
    cursor = connection.cursor()

    cursor.execute(f"SELECT column_name FROM user_tab_columns WHERE table_name = '{tabelaS.upper()}'")

    print(f"Colunas da tabela {tabelaS}:")
    for coluna in cursor:
        print(coluna[0])

def listar_tabelas():
    cursor = connection.cursor()

    cursor.execute("SELECT table_name FROM user_tables")

    print("Tabelas no banco de dados:")
    for tabela in cursor:
        print(tabela[0])

def visualizar_dados():
    tabelaS = input("Qual tabela deseja selecionar: ")
    cursor.execute(f"SELECT * FROM {tabelaS}")
    for row in cursor:
        print(row)



def inserir_dados():
    tabelaS = input("Qual tabela deseja inserir um novo registro: ")
    listar_colunas()
    cursor.execute(f"INSERT INTO {tabelaS} VALUES (:1, :2, :3, :4)", (id, nome, cargo, salario))
    connection.commit()


def atualizar_dados():
    tabelaS = input("Qual tabela deseja atualizar um registro: ")
    listar_colunas()
    id = int(input("Digite o ID do registro que você quer atualizar: "))
    coluna = input("Qual coluna deseja atualizar o valor")
    valor = input("Digite o novo valor")
    cursor.execute(f"UPDATE {tabelaS} SET {coluna} = :1 WHERE id = :2", (valor, id))
    connection.commit()


def excluir_dados(dados):
    tabelaS = input("Qual tabela deseja deletar um registro: ")
    cursor.execute("DELETE FROM funcionarios WHERE id = :1", (id,))
    connection.commit()