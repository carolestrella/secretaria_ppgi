#language: pt

Funcionalidade: Como um administrador, para que eu possa disponibilizar diárias e passagens, eu gostaria de definir o prazo para solicitação de passagens

Contexto: 
  Dado que eu esteja cadastrado como administrador com email "admin@admin.com"
  E que eu esteja autenticado com o email 'admin@admin.com' e a senha 'admin123'
  E que eu esteja na página inicial
  E eu clicar no botão "Editar data limite para solicitações"

  Cenário: A página de definir um prazo é carregada corretamente
    Dado que eu insira a data "1" - "January" - "2021" às "17":"30"
    E eu clicar no botão "Definir prazo"
    Então o prazo para solicitação é atualizado com o valor "1" - "January" - "2021" às "17":"30"

  Cenário: Coloco uma data anterior à atual
    Dado que eu insira a data "1" - "January" - "2015" às "17":"30"
    E eu clicar no botão "Definir prazo"
    Então vejo uma mensagem "Deadline cannot be less than current date"