# sprint-4 - python

Nome dos integrantes e RM:
Razyel Ferrari rm551875-git: irazyel
Rayzor Anael rm551832-git: rozyar
Derick Araújo rm551007-git: dericki
Kalel Schlichting rm550620-git: K413l
Phablo santos rm550687-git:PhabloFiap


Conexão com o Banco de Dados:

O código inicia estabelecendo uma conexão com um banco de dados Oracle usando a biblioteca oracledb. As credenciais de usuário, senha e o DSN (nome do serviço) são fornecidos para autenticação.
Funções CRUD (Create, Read, Update, Delete):

Existem funções para listar tabelas, visualizar dados, inserir dados, atualizar dados e excluir dados no banco de dados Oracle. Cada função interage com o banco de dados executando consultas SQL correspondentes às operações CRUD.
Criação de Relatório em CSV:

Há uma função chamada criar() que cria um relatório em formato CSV a partir dos dados de uma tabela específica. O usuário fornece o nome da tabela, e a função executa uma consulta SQL para obter os dados. Em seguida, esses dados são escritos em um arquivo CSV com um nome formatado que inclui a tabela e a data.
Menu Principal (Função main()):

A função main() é a parte principal do programa. Ela apresenta um menu para o usuário com opções como listar tabelas, visualizar dados, inserir dados, etc. O usuário pode escolher uma opção e o programa executa a ação correspondente. A execução continua até que o usuário escolha sair.
Encerramento Adequado:

O programa encerra de maneira adequada, fechando o cursor e a conexão com o banco de dados. Além disso, são incluídos tratamentos para exceções (erros) que podem ocorrer durante a execução do programa.
Início do Programa:

Antes de entrar no menu principal, o programa pergunta ao usuário se ele deseja iniciar o programa. Se o usuário disser "N", o programa agradece e encerra. Isso oferece flexibilidade ao usuário para decidir se deseja ou não prosseguir.
Essencialmente, o código cria uma interface para que o usuário possa interagir com um banco de dados Oracle, realizando operações comuns de CRUD e gerando relatórios em CSV. Ele é estruturado de forma a lidar com possíveis erros e a fechar adequadamente as conexões com o banco de dados.

OBS: não compreendi muito bem se os relatorios deveriam ser extraidos diretamente pela aplicação ou por mim no caso eu os extrai T_SAK_ESTADO filtra os estados de codigo 1 e T_SAK_CIDADE filtra as cidades de codigo de estado 1, de qualquer forma criei uma função que extrai reports direto do banco de dados em csv e os renomeia 