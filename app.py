import crud
import report
import oracledb
import csv

connection = oracledb.connect(user = 'RM550620',password = '130400',dsn = 'oracle.fiap.com.br/orcl') 
cursor = connection.cursor()

def main():

    case = str(input("Deseja iniciar o programa? Y/N"))
    if case != "N":
        while True:
            print("\nMenu Principal Pessoas:")
            print("1. Visualizar Dados")
            print("2. Inserir Dados")
            print("3. Atualizar Dados")
            print("4. Excluir Dados")
            print("5. Criar Report")
            print("6. Sair")

            escolha = input("Escolha uma opção: ")

            if escolha == "1":
                crud.visualizar_dados(dados)
            elif escolha == "2":
                crud.inserir_dados(dados)
            elif escolha == "3":
                crud.atualizar_dados(dados)
            elif escolha == "4":
                crud.excluir_dados(dados)
            elif escolha == "5":
                crud.excluir_dados(dados)
            elif escolha == "6":
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