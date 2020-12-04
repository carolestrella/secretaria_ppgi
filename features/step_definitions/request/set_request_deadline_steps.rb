# Dado /^Eu esteja cadastrado como administrador, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}$/ do |Name, Email, Pasword, Role, Registration|
#   @adm = {
#     Name: 'Administrador',
#     Email: 'admin@admin.com',
#     Password: 'admin123',
#     Role: "admin",
#     Registration: "000000000"
#   }
#   Admin.create!(@adm)
# end

# E /^Eu esteja autenticado como administrador do
#   @admin = Admin.find_by_email('admin@admin.com')
# end

# E /^Eu esteja na (.+)$/ do |root_path|
#   visit path_to(root_path)
# end

# Quando /^Eu clico em ([^"]*)"$/ do |button|
#   click_button(button)
# end

# Então /^Eu devo estar na página (.+)$/ do |prazos_index|
#   current_path = URI.parse(current_url).path
#   if current_path.respond_to? :should
#     current_path.should == path_to(prazos_index)
#   else
#     assert_equal path_to(prazos_index), current_path
#   end
# end

# Quando /^Eu clico em ([^"]*)"$/ do |button|
#   click_button(button)
# end

# E /^Eu preencho "([^"]*)" com "([^"]*)"$/ do |field, value|
#   fill_in(field, :with => value)
# end 

# Quando /^Eu aperto enter no teclado$/ do
#   page.evaluate_script('window.confirm = function() { return true; }')
#   page.click('Ok')
# end

# Então /^Eu devo ver ([^"]*)"$/ do |text|
#   if page.respond_to? :should
#     page.should have_content(text)
#   else
#     assert page.has_content?(text)
#   end
# end

Dado('que eu esteja cadastrado como administrador com email {string}') do |email|
  @email = email
  valid_email = email.eql? "admin@admin.com"
  expect(email).to be true
end

E('que eu esteja autenticado') do
  authenticate(admin)
end

E('que eu esteja na pagina inicial') do
  visit(root_path)
end

Quando ('Eu clico em (.*?)"') do |button|
  click_button(button)
end

Dado('deve haver um botão para escolher um período a ser definido') do
  find("#escolher_periodo")
end

Então('eu devo estar em uma página com uma tabela com os dados:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  # | type | value |
  # | Deadline | 30/10/2020 - 01/11/2020 |
  data = table.hashes
  type = []
  values = []

  data.each do |row|
    row.each do |key, value|
      if key.eql? "type"
        type << value
      elsif key.eql? "value"
        values << value
      end
    end
  end
  # a ser implementado
  has_table = page.has_css?("#table")
  find("#table")
  valid_table = is_equal(find("#table"), type, values)
  valid = has_table && valid_table
  expect(valid).to be true
end

Então('eu preencho os dados') do
  dados = get_data
  find("input[placeholder*= dados]").set dados
end

Então('eu devo estar em uma página confirmando a solicitação') do
  confirm_page = page.has_css?("#confirm_solicitacao")
  expect(confirm_page).to be true
end

Se('Não coloco uma período válido e é inviável fazer solicitações') do
  pending
end