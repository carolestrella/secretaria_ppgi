#language:pt

Funcionalidade: Realizar solicitação de diárias para um período
    Como um usuário
    Para que eu possa receber o auxílio
    Eu gostaria de fazer uma solicitação de diárias para um período

    Contexto: 
      Dado que eu esteja cadastrado como usuario "student@student.com"
      E que eu esteja autenticado com o email "student@student.com" e a senha "admin123"
      E que esteja na página inicial
      E eu clicar no botão Solicitar diárias

    Cenário: A solicitação de diárias é bem sucedida
      Dado que eu insira a data de entrada do "booking" como dia "1" do mês "January" do ano "2020"
      E que eu insira a data de saída do "booking" como dia "5" do mês "January" do ano "2020"
      E eu clicar no botão "Solicitar diárias"
      Então a diária com data de entrada "1" - "January" - "2020" e data de saída "5" - "January" - "2020", pertencente ao usuário "student@student.com", é criada

    Cenário: Usuário solicita diária com data de fim anterior à data de início
      Dado que eu insira a data de entrada do "booking" como dia "5" do mês "January" do ano "2020"
      E que eu insira a data de saída do "booking" como dia "1" do mês "January" do ano "2020"
      E eu clicar no botão "Solicitar diárias"
      Então vejo uma mensagem "Data entrada cannot be greater than return date"