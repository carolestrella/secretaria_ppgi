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

  Dado("que esteja cadastrado como usuario") do
    visit(root_path)
    click_link("Sair")
    @user = {
      id: '11',
      full_name: 'usuario',
      email: 'user@email.com',
      password: '123456',
      role: "student",
      registration: "000000000"
    }
    User.create!(@user)
  end

  Dado('que esteja autenticado e não seja administrador de email: {string} e senha: {string}') do |email,senha|
    visit(new_user_session_path)
    fill_in "user[email]", with: email
    fill_in "user[password]", with: senha
    click_button("Log in")
  end

  E ("tente acessar pagina de que lista as requisições") do
    visit(requests_path)
  end

  Então ("a tela deve mostrando a mensagem {string}") do |mensagem|
    expect(page).to have_text(mensagem)
  end