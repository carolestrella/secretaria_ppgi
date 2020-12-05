#language: pt
#encoding: utf-8

Funcionalidade: Solicitar passagens
  Como um usuário 
  Para que eu possa receber o auxílio 
  Eu gostaria de fazer uma solicitação de passagens para um período.

  Contexto: 
    Dado que eu esteja cadastrado como usuario com email "student@student.com"
    E que eu realize login como usuário, com email "student@student.com" e senha "admin123"
    E que eu esteja na página inicial
    E eu clicar no botão "Solicitar passagem"

  Cenário: A passagem é solicitada com sucesso
    Dado que eu insira a data de entrada do "ticket" como dia "1" do mês "January" do ano "2020"
    E que eu insira a data de saída do "ticket" como dia "5" do mês "January" do ano "2020"
    E eu clicar no botão "Solicitar passagem"
    Então a passagem com data de entrada "1" - "January" - "2020" e data de saída "5" - "January" - "2020", pertencente ao usuário "student@student.com", é criada

  Cenário: A passagem não é solicitada pois a data de saída é anterior à de entrada
    Dado que eu insira a data de entrada do "ticket" como dia "5" do mês "January" do ano "2020"
    E que eu insira a data de saída do "ticket" como dia "1" do mês "January" do ano "2020"
    E eu clicar no botão "Solicitar passagem"
    Então vejo uma mensagem "Data entrada cannot be greater than return date" 
