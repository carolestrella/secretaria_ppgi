Dado("que eu esteja cadastrado como usuario com email {string}") do |email|
  @user = User.find_by_email(email)

  expect(@user.nil?).to eq(false)
end

E("que eu realize login como usuário, com email {string} e senha {string}") do |email, password|
  visit '/users/sign_in'
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  click_button "Log in"
end

E("que eu esteja na página inicial") do
  visit(root_path)
end

E("eu clicar no botão {string}") do |button|
  click_button(button)
end

# -- Cenário Feliz -- #
Dado('que eu insira a data de entrada do {string} como dia {string} do mês {string} do ano {string}') do |type, day, month, year|
  id = "#{type}_data_entrada"
  select year,   from: "#{id}_1i"
  select month,  from: "#{id}_2i"
  select day,    from: "#{id}_3i"
end

E('que eu insira a data de saída do {string} como dia {string} do mês {string} do ano {string}') do |type, day, month, year|
  id = "#{type}_data_saida"
  select year,   from: "#{id}_1i"
  select month,  from: "#{id}_2i"
  select day,    from: "#{id}_3i"
end

Então ('a passagem com data de entrada {string} - {string} - {string} e data de saída {string} - {string} - {string}, pertencente ao usuário {string}, é criada') do |day_in, month_in, year_in, day_out, month_out, year_out, email|
  @user = User.find_by_email(email)
  
  @user_tickets = Ticket.where(user_id: @user.id, data_entrada: Date.parse("#{year_in}-#{month_in}-#{day_in}"), data_saida: Date.parse("#{year_out}-#{month_out}-#{day_out}"))

  expect(@user_tickets.any?).to eq true
end

Dado('que eu insira a data de entrada como dia {string} do mês {string} do ano {string}') do |string, string2, string3|
  pending # Write code here that turns the phrase above into concrete actions
end

Então('vejo uma mensagem {string}') do |message|
  expect(page).to have_text message
end