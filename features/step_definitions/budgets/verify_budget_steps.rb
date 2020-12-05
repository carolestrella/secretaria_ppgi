#-------------------- Contexto --#
Dado("que eu esteja cadastrado como administrador, com o email {string}") do |email|
  @user = User.find_by_email(email)

  expect(@user.nil?).to eq(false)
end
 
E("que eu realize login com o email {string} e a senha {string}") do |email, password|
  visit '/users/sign_in'
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  click_button "Log in"
end

E("que esteja autenticado na página inicial") do
  expect(page).to have_text("Usuário atual")
end

#-------------------- Cenário feliz --#
Dado("que eu tenha {float} de orçamento disponível") do |value|
  @budgets = Budget.all

  @budgets.each do |budget|
    budget.destroy!
  end
  
  Budget.create!(value: value)

  @budget = Budget.all
  
  expect(@budget.count).to eq 1
  expect(@budget[0].value).to eq value
end

E("que eu clique no botão Verificar orçamento") do
  click_button "Verificar orçamento"
end

Então("o valor {string} é exibido") do |value|
  expect(page).to have_text(value)
end

#-------------------- Cenário triste --#
Dado('que não exista nenhum orçamento registrado') do
  @budgets = Budget.all

  @budgets.each do |budget|
    budget.destroy!
  end
end

Então('o valor uma mensagem de erro é exibida') do
  expect(page).to have_text('Não há orçamento cadastrado.')
end