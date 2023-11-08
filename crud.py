def visualizar_dados(dados):
    if not dados:
        print("Nenhum dado disponível.")
    else:
        for i, registro in enumerate(dados, 1):
            print(f"Registro {i}: {registro}")


def inserir_dados(dados):
    try:
        nome = str(input("Digite o nome: "))
        idade = int(input("Digite a idade: "))
        cpf = input("Digite a cpf: ")
        rg = input("Digite a rg: ")
        sexo = input("Qual o seu sexo")

        novo_registro = {"Nome": nome, "Idade": idade, "CPF": cpf, "RG": rg, "Sexo": sexo}
        dados.append(novo_registro)
        print("Dados inseridos com sucesso.")
    except ValueError:
        print("Erro: Idade deve ser um número inteiro válido.")


def atualizar_dados(dados):
    visualizar_dados(dados)
    try:
        indice = int(input("Digite o número do registro que deseja atualizar: ")) - 1
        if 0 <= indice < len(dados):
            nome = input("Digite o novo nome: ")
            idade = int(input("Digite a idade: "))
            cpf = input("Digite a cpf: ")
            rg = input("Digite a rg: ")
            sexo = input("Qual o seu sexo")

            dados[indice]["Nome"] = nome
            dados[indice]["idade"] = idade
            dados[indice]["rg"] = rg
            dados[indice]["cpf"] = cpf
            dados[indice]["Idade"] = sexo

            print("Dados atualizados com sucesso.")
        else:
            print("Índice inválido.")
    except ValueError:
        print("Erro: Idade deve ser um número inteiro válido.")


def excluir_dados(dados):
    visualizar_dados(dados)
    try:
        indice = int(input("Digite o número do registro que deseja excluir: ")) - 1
        if 0 <= indice < len(dados):
            del dados[indice]
            print("Registro excluído com sucesso.")
        else:
            print("Índice inválido.")
    except ValueError:
        print("Erro: Índice deve ser um número inteiro válido.")