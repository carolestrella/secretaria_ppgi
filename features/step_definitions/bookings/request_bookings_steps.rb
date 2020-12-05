Dado('que eu esteja cadastrado como usuario {string}') do |email|
  @email = email
  teste = email.eql? "student@student.com"
  expect(teste).to be true
end
  
Dado('que eu esteja autenticado com o email {string} e a senha {string} 2') do |email, password|
  visit '/users/sign_in'
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  click_button "Log in"
end

Dado('que esteja na página inicial') do
  expect(page).to have_text("Usuário atual")
end

Dado('eu clicar no botão Solicitar diárias') do
  click_button("Solicitar diárias")
end

Dado('que eu insira data de entrada {string}') do |date|
  fill_in 'data_entrada', :with => date
  expect(page).to have_field('data_entrada', with: date)
end

E('que eu insira data de saida {string}') do |date|
  fill_in 'data_saida', :with => date
  expect(page).to have_field('data_saida', with: date)
end

Então ('a diária com data de entrada {string} - {string} - {string} e data de saída {string} - {string} - {string}, pertencente ao usuário {string}, é criada') do |day_in, month_in, year_in, day_out, month_out, year_out, email|
  @user = User.find_by_email(email)
  
  @user_bookings = Booking.where(user_id: @user.id, data_entrada: Date.parse("#{year_in}-#{month_in}-#{day_in}"), data_saida: Date.parse("#{year_out}-#{month_out}-#{day_out}"))

  expect(@user_bookings.any?).to eq true
end

# oi
E('que eu clique no botão de {string}') do |nome|
  click_button(nome)
end

Então('eu devo estar em uma página de confirmação') do

  # puts @data_entrada
  # puts @data_saida

  expect(page).to have_text("Diarium was successfully created.")
  # expect(page).to have_text("Data de entrada: 00/00/0000")
end

#----------------- cenario triste
Dado('que o usuário insere uma data inválida {string}') do |string|

  require 'date'
  def valid_date?( str, format="%d/%m/%Y" )
    Date.strptime(str,format) rescue false
  end

  valid = valid_date?(string)
  expect(valid).to be false
  
end

Então('eu devo ver uma mensagem de erro') do
  find("#error_msg")
end