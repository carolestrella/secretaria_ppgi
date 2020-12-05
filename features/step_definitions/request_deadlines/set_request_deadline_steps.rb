E('que eu esteja autenticado') do
  authenticate(admin)
end

#E que eu esteja na pagina inicial

#E eu clicar no botão "Definir prazo"

Dado("que eu insira a data {string} - {string} - {string} às {string}:{string}") do |day, month, year, hour, minute|
  id = 'request_deadline_deadline'
  select year,   from: "#{id}_1i"
  select month,  from: "#{id}_2i"
  select day,    from: "#{id}_3i"
  select hour,    from: "#{id}_4i"
  select minute,    from: "#{id}_5i"
end

Então("o prazo para solicitação é atualizado com o valor {string} - {string} - {string} às {string}:{string}") do |day, month, year, hour, minute|
  @request_deadlines = RequestDeadline.all

  expect(@request_deadlines.count).to eq 1
  expect(@request_deadlines[0].deadline).to eq DateTime.new(Integer(year), Date::MONTHNAMES.index(month), Integer(day), Integer(hour), Integer(minute), 0, "+0").to_s(:db)
end