FactoryBot.define do
  factory :booking do
    data_entrada { "2020-12-04" }
    data_saida { "2020-12-04" }
  end
  
  factory :request_deadline do
    deadline { "2020-12-04 16:53:43" }
  end

  factory :ticket do
    data_entrada { "2020-12-04" }
    data_saida { "2020-12-04" }
  end

  factory :budget do
    value { "9.99" }
  end

  factory :requirement do
    requirements { "MyString" }
  end

  factory :user do
    full_name {"Teste da Silva"}
    email {"testesilva@teste.com"}
    password {"123456"}
    role {1}
    registration {"0123456789"}
  end

  factory :request_type do
    title {"Diária"}
  end

  factory :request do 
    request_type_id {1} 
    user_id {1 }
    documents {fixture_file_upload(Rails.root.join('public', 'dummy_pdf.pdf'), 'application/pdf')}
  end
end