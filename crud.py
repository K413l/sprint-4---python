import oracledb
import csv

connection = oracledb.connect(user = 'RM551007',password = '030803',dsn = 'oracle.fiap.com.br/orcl')  
cursor = connection.cursor()

def listar_colunas(tabelaS):
    cursor = connection.cursor()
    cursor.execute(f"SELECT column_name FROM user_tab_columns WHERE table_name = '{tabelaS.upper()}'")

    colunas = [coluna[0] for coluna in cursor.fetchall()]  
    print(f"Colunas da tabela {tabelaS}: {', '.join(colunas)}") 

    cursor.close()

    return colunas 



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
    
    listar_colunas(tabelaS)

    valores = []
    for coluna in listar_colunas(tabelaS):
        valor = input(f"Insira um valor para a coluna {coluna}: ")
        valores.append(valor)

    placeholders = ":" + ", :".join(str(i + 1) for i in range(len(valores)))

    query = f"INSERT INTO {tabelaS} VALUES ({placeholders})"
    cursor = connection.cursor()
    cursor.execute(query, tuple(valores))
    connection.commit()


def atualizar_dados():
    tabelaS = input("Qual tabela deseja atualizar um registro: ")
    listar_colunas(tabelaS)
    coluna = input("Qual coluna deseja atualizar o valor")
    colunaID = input("Qual coluna ID da tabela")
    id = int(input("Digite o ID do registro que você quer atualizar: "))
    valor = input("Digite o novo valor")
    cursor.execute(f"UPDATE {tabelaS} SET {coluna} = :1 WHERE {colunaID} = :2", (valor, id))
    connection.commit()


def excluir_dados():
    tabelaS = str(input("Qual tabela deseja deletar um registro: "))
    listar_colunas(tabelaS)
    Coluna = input("Coluna que deseja selecionar: ")
    id_para_deletar = input("Qual é o ID do registro que deseja excluir: ")
    
    
    cursor = connection.cursor()
    cursor.execute(f"DELETE FROM {tabelaS} WHERE {Coluna} = :1", (id_para_deletar,))
    connection.commit()
