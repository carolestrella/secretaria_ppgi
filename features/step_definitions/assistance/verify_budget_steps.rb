#-------------------- Contexto --#
Dado("que eu esteja cadastrado como administrador, com o email {string} e a senha {string}") do |email, password|
  @email = email
  @password = password
  valid_email = @email.eql? "admin@admin.com"
  valid_psswd = @password.eql? "123456"
  valid_user = valid_email && valid_psswd
  expect(valid_user).to be true
end
 
E("que eu esteja autenticado com o email {string} e a senha {string}") do |email, password|
  auth = @email.eql? email
  auth2 = @password.eql? password
  authentication = auth && auth2
  expect(authentication).to be true
end

E("que esteja na pagina inicial") do
  visit(root_path)
end

E("que eu clique no botão Verificar Orçamento") do
  click_button "Verificar Orçamento"
end

#-------------------- Cenário feliz --#
Dado("que a página é carregada corretamente") do
  pending
end

E("que eu tenha {float} de orçamento disponível") do |value|
  @value = value
  budget = @value > 0
  expect(budget).to be true
end
 
Então("o valor {float} é exibido") do |value|
  same_val = @value.eql? value
  expect(same_val).to be true
end

#-------------------- Cenário triste --#
E("um valor diferente de {float} é exibido") do |value|
  dif_val = @value.eql? value
  expect(dif_val).to be false
end

Então("uma mensagem de erro deve ser exibida") do
  alert = find("#error_msg")
  expect(alert).to be true
end