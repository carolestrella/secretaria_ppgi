#-------------------- Contexto --#
Dado("que eu esteja cadastrado como administrador para definir requisitos de solicitações, com o email {string} e a senha {string}") do |email, password|
  @user = User.find_by_email(email)

  expect(@user.nil?).to eq(false)
end

E("que eu esteja autenticado com o email {string} e a senha {string}") do |email, password|
  visit '/users/sign_in'
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  click_button "Log in"
end

# E que esteja na página inicial

E("que eu clique no botão Editar requisitos de solicitação") do
  click_button("Editar requisitos de solicitação")
end

#-------------------- Cenário feliz --#

Dado("que eu insira o requisito {string}") do |requirement|
  fill_in 'requirement_text', :with => requirement

  expect(page).to have_field("requirement_text", with: requirement)
end

Então("os requisitos são atualizados com o valor {string}") do |requirements|
  @requirements = Requirement.all

  expect(@requirements.count).to eq 1
  expect(@requirements[0].requirements).to eq(requirements)
end

#-------------------- Cenário triste --#
Então("uma mensagem de erro é exibida") do
  expect(page).to have_text("Ocorreu um erro ao salvar os requisitos.")
end

