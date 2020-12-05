#language:pt

Funcionalidade: Verificar se há orçamento disponível
  Como um administrador
  Para que eu possa disponibilizar os auxílios
  Eu gostaria de verificar se ainda há orçamento disponível para diárias e passagens

  Contexto:
    Dado que eu esteja cadastrado como administrador, com o email "admin@admin.com"
    E que eu realize login com o email "admin@admin.com" e a senha "admin123"
    E que esteja autenticado na página inicial

  Cenário: Orçamento carrega corretamente
    Dado que eu tenha 500.98 de orçamento disponível
    E que eu clique no botão Verificar orçamento
    Então o valor "500.98" é exibido

  Cenário: Exibição do orçamento falha
    Dado que não exista nenhum orçamento registrado
    E que eu clique no botão Verificar orçamento
    Então o valor uma mensagem de erro é exibida