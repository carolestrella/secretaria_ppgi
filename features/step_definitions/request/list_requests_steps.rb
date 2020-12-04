# Dado("que eu esteja cadastrado como administrador, com nome: {Name}, email: {Email}, senha: {Password}, cargo: {Role} e registro: {Registration}") do |Name, Email, Pasword, Role, Registration|
#     pending
# end

# E("que eu esteja autenticado como {Role}") do |Role|
#     pending
# end

# E("que eu esteja na página inicial") do
#     visit(root_path)
# end

# E("eu clicar no link do painel de administrador") do
#     pending
# end

# E("eu clicar em na lista de solicitações") do
#     pending
# end

# Então("eu devo estar em uma página com uma tabela mostrando os dados ordenados") do
#     pending
# end

  Dado('que eu esteja cadastrado como admin') do
    @adm = {
      id: '10',
      full_name: 'Administrador2',
      email: 'admin@admin2.com',
      password: 'admin1234',
      role: "administrator",
      registration: "000000000"
    }
    User.create!(@adm)
  end


  E('que esteja autenticado com email: {string} e senha: {string}') do |email,password|
    visit(new_user_session_path)
    fill_in "user[email]", with: email
    fill_in "user[password]", with: password
    click_button("Log in")
  end
  
  E('que esteja na home page') do
    if(!expect(page).to have_text("Usuário atual"))
      visit(root_path)
    end
  end

  E('eu clicar no link do painel de administrador') do
    click_link("Painel de Administrador")
  end
  
  E('eu clicar em na lista de solicitações') do
    if(!expect(page).to have_text("Painel do Administrador"))
      visit(admin_panel_path)
    end
    click_link("Mostrar lista de Requisições")
  end
  
  Dado('que Lista de Solicitações aparece adequadamente') do
    expect(page).to have_text("Lista de Requisições")
  end

  E('exista a Solicitação {string}') do |documents|
    @requestType = {
      id: '10',
      title: 'Diaria'
    }
    @request = {
      user_id: '10',
      request_type_id: '10',
      documents: 'teste'
    }
    RequestType.create!(@requestType)
    Request.create!(@request)
  end
  
  Então('eu devo estar em uma página com uma tabela mostrando os dados ordenados') do |table|
    table_results = page.find('#tableResults')
  end