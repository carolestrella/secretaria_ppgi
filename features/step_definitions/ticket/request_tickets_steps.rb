# Dado /^Eu esteja cadastrado como usuario, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}$/ do |Name, Email, Pasword, Role, Registration|
#   @user = {
#     Name: 'Usuario',
#     Email: 'user@user.com',
#     Password: 'user123',
#     Role: "user",
#     Registration: "000000000"
#   }
#   User.create!(@user)
# end
  
#   E /^Eu esteja autenticado como usuario do
#     @user = User.find_by_email('user@user.com')
#   end
  
#   E /^Eu esteja na "(.*?)"$/ do |root_path|
#     visit path_to(root_path)
#   end
  
#   Quando /^Eu clico em ([^"]*)"$/ do |button|
#     click_button(button)
#   end
  
#   Então /^Eu devo estar na página "(.*?)"$/ do |tickets_index|
#     current_path = URI.parse(current_url).path
#     if current_path.respond_to? :should
#       current_path.should == path_to(prazos_index)
#     else
#       assert_equal path_to(prazos_index), current_path
#     end
#   end
  
#   Quando /^Eu clico em ([^"]*)"$/ do |button|
#     click_button(button)
#   end
  
#   E /^Eu preencho "([^"]*)" com "([^"]*)"$/ do |field, value|
#     fill_in(field, :with => value)
#   end 
  
#   Quando /^Eu aperto enter no teclado$/ do
#     page.evaluate_script('window.confirm = function() { return true; }')
#     page.click('Ok')
#   end
  
#   Então /^Eu devo ver ([^"]*)"$/ do |text|
#     if page.respond_to? :should
#       page.should have_content(text)
#     else
#       assert page.has_content?(text)
#     end
#   end

######################################################################################

Dado("que eu esteja cadastrado como usuario com email {string}") do |email|
    @email = email
    valid_email = email.eql? "user@user.com"
    expect(valid_email).to be true
end

E("que eu esteja autenticado como usuario") do
#   authenticate(user)
    valid_email = @email.eql? "user@user.com"
    expect(valid_email).to be true
end

E("que eu esteja na página inicial") do
  visit(root_path)
end

E("eu clicar no botão {string}") do |button|
  click_button(button)
end

Então ('Eu devo estar na página "(.*?)"') do |tickets_index|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(tickets_index)
  else
    assert_equal path_to(prazos_index), current_path
  end
end

E("eu clicar no botão {string}") do |button|
  click_button(button)
end

E ('Eu preencho "([^"]*)" com "([^"]*)"') do |field, value|
  fill_in(field, :with => value)
end   

Quando ('Eu aperto enter no teclado') do
  page.evaluate_script('window.confirm = function() { return true; }')
  page.click('Ok')
end

Então ('Eu devo ver "([^"]*)"') do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Dado("a página de solicitação de passagens seja carregada corretamente") do
  solicit_psg = page.has_css?("#solicit_passagens")
  expect(solicit_psg).to be true
end

E("exista um botão para escolher um período para fazer uma solicitação") do
  find("#escolher_periodo")
end

Então("eu devo estar em uma página com uma tabela com os dados:") do
  # | solicitation | name |
  # | period | 30/10/2020 - 01/11/2020 |
  data = table.hashes
  solicits = []
  names = []

  data.each do |row|
    row.each do |key, value|
      if key.eql? "solicitation"
        solicits << value
      elsif key.eql? "name"
        names << value
      end
    end
  end
  # a ser implementado
  has_table = page.has_css?("#table")
  find("#table")
  valid_table = is_equal(find("#table"), solicits, names)
  valid = has_table && valid_table
  expect(valid).to be true
end 

E('não é possível fazer uma solicitação de passagens para o período escolhido') do
  verify_disponibilidade()
end

Então('vejo uma mensagem {string}') do |msg|
  alert = find("#msg_disp")
  expect(alert.text).to be msg
end

Dado('não há dados cadastrados para o usuário fazer uma solicitação e receber auxílio') do
  expect(user(@email).has_data).to be false
end

Então('vejo uma mensagem {string}') do |msg_erro|
  alert = find("#error_msg")
  expect(alert.text).to be msg_erro
end
