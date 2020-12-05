#language:pt

Funcionalidade: Listar todas as solicitações de acordo com as suas prioridades
   Como um administrador 
   Para que eu possa disponibilizar os auxílios 
   Eu gostaria de verificar a lista de solicitações de acordo com as prioridades

   Contexto:
      Dado que eu esteja cadastrado como admin
      #{
      #    full_name: "Administrador",
      #    email: "admin@admin2.com", 
      #    password: "admin1234", 
      #    role: "administrator", 
      #    registration: "000000000"
      # }
      E que esteja autenticado com email: "admin@admin2.com" e senha: "admin1234"
      E que esteja na home page
      E eu clicar no link do painel de administrador
      E eu clicar em na lista de solicitações
   
   Cenário: Dado que Lista de Solicitações aparece adequadamente
      E exista a Solicitação "teste"
      Então eu devo estar em uma página com uma tabela mostrando os dados ordenados
      | Documentos | | Tipos de Requisição | | Nome do Requerente |
      | teste      | | Diaria              | | Administrador2     |
       

   #cenario triste
    Cenário: 
      Dado que esteja cadastrado como usuario
      #{
      #   id: '11',
      #   full_name: 'usuario',
      #   email: 'user@email.com',
      #   password: '123456',
      #   role: "student",
      #   registration: "000000000"
      #}
      Dado que esteja autenticado e não seja administrador de email: "user@email.com" e senha: "123456"
      E tente acessar pagina de que lista as requisições
      Então a tela deve mostrando a mensagem "Você precisa ser administrador para acessar essa Pagina:"