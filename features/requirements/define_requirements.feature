#language:pt

Funcionalidade: Definir os requisitos para solicitação de auxílio
  Como um administrador 
  Para que eu possa disponibilizar diárias e passagens 
  Eu gostaria de disponibilizar os requisitos para fazer uma solicitação

  Contexto:
    Dado que eu esteja cadastrado como administrador para definir requisitos de solicitações, com o email 'admin@admin.com' e a senha '123456'
    E que eu esteja autenticado com o email 'admin@admin.com' e a senha 'admin123'
    E que esteja na página inicial
    E eu clicar no botão "Editar requisitos de solicitação"

  Cenário: Edição de requisitos é bem sucedida
    Dado que eu insira o requisito "Idade maior que 18 anos"
    E eu clicar no botão "Definir requisitos"
    Então os requisitos são atualizados com o valor "Idade maior que 18 anos"
    

  Cenário: Edição de requisitos contém requisito em branco
    Dado que eu insira o requisito ""
    E eu clicar no botão "Definir requisitos"
    Então uma mensagem de erro é exibida