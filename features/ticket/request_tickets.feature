#language: pt
#encoding: utf-8

Funcionalidade: Solicitar passagens
  Como um usuário 
  Para que eu possa receber o auxílio 
  Eu gostaria de fazer uma solicitação de passagens para um período.

  Contexto: 
    Dado que eu esteja cadastrado como usuario com email "user@user.com"
    # {
    #   "full_name": "Usuário",
    #   "email": "user@user.com",
    #   "password": "user123",
    #   "role": "user",
    #   "registration": "000000000"
    # }

    E que eu esteja autenticado como usuario
    E que eu esteja na pagina inicial
    E eu clicar no botão "Solicitar passagens"

  Cenário: Página carrega corretamente
    Dado a página de solicitação de passagens seja carregada corretamente 
    E exista um botão para escolher um período para fazer uma solicitação
    Então eu devo estar em uma página com uma tabela com os dados:

    | solicitation | name |
    | period | 30/10/2020 - 01/11/2020 |

  Cenário: Não é possivel solicitar passagens
    Dado a página de solicitação de passagens seja carregada corretamente 
    E não é possível fazer uma solicitação de passagens para o período escolhido
    Então vejo uma mensagem "Não é possivel solicitar passagens para o período"

    Dado não há dados cadastrados para o usuário fazer uma solicitação e receber auxílio
    Então vejo uma mensagem "Erro: Dados invalidos"