import crud
import report as rep
import oracledb
import csv

connection = oracledb.connect(user = 'RM551007',password = '030803',dsn = 'oracle.fiap.com.br/orcl') 
#connection = oracledb.connect(user = 'RM550620',password = '130400',dsn = 'oracle.fiap.com.br/orcl') 
cursor = connection.cursor()

def main():

    case = str(input("Deseja iniciar o programa? Y/N"))
    if case != "N":
        while True:

            print("\nMenu Principal:")
            print("1. Listar Tabelas")
            print("2. Visualizar Dados")
            print("3. Inserir Dados")
            print("4. Atualizar Dados")
            print("5. Excluir Dados")
            print("6. Criar Report")
            print("7. Sair")

            escolha = input("Escolha uma opção: ")

            if escolha == "1":
                crud.listar_tabelas()
            if escolha == "2":
                crud.visualizar_dados()
            elif escolha == "3":
                crud.inserir_dados()
            elif escolha == "4":
                crud.atualizar_dados()
            elif escolha == "5":
                crud.excluir_dados()
            elif escolha == "6":
                rep.criar()
            elif escolha == "7":
                print("Saindo do programa.")
                cursor.close()
                connection.close()
                break
            else:
                print("Opção inválida. Tente novamente.")
    else:
        print("obrigado pelo serviços")
        cursor.close()
        connection.close()


main()