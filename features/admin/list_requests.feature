#language:pt

Funcionalidade: Listar todas as solicitações de acordo com as suas prioridades
   Como um administrador 
   Para que eu possa disponibilizar os auxílios 
   Eu gostaria de verificar a lista de solicitações de acordo com as prioridades

   Contexto:
      Dado que eu esteja cadastrado como admin
      E que eu realize login com o email "admin@admin.com" e a senha "admin123"
      E que esteja autenticado na página inicial
      E eu clicar no botão "Visualizar solicitações de diárias e passagens"
   
    Cenário: As listas de passagens e diárias aparecem corretamente
      Dado que exista a passagem com entrada em "1" - "January" - "2021" e a saída em "2" - "January" - "2021"
      E que exista a diária com entrada em "1" - "January" - "2021" e a saída em "2" - "January" - "2021"
      Então eu devo estar em uma página com uma tabela mostrando os dados ordenados

    Cenário: 
      Dado que esteja cadastrado como estudante com email "student@student.com"
      E que esteja autenticado na página inicial com email "student@student.com" e senha "admin123"
      E tente acessar pagina de que lista as requisições
      Então a tela deve mostrando a mensagem "Você precisa ser administrador para acessar essa página"