# frozen_string_literal: true

company = Company.create(
  company_code: 'C0001',
  company_name: 'Terceirizados Construções LTDA',
  company_branch: 'Construções'
)

role = Role.create(
  role_code: "R0001",
  role_name: "Mestre de Obras",
  role_description: "Responsavel por Gerenciar profissionais que executam as tarefas da Obra.",
  role_category: 'encarregado'
)

Official.create!(
  official_code: "O0001",
  official_name: "José Carlos",
  login_name: "jose.carlos",
  cellphone: "5511983228785",
  password: "sgo1234567897",
  role_id: role.id,
  company_id: company.id
)

activity = Activity.create!(
  activity_code: "A0001",
  activity_name: "Fundação Sapata Corrida - SPC01",
  activity_description: "Execução da Sapara SPC01",
  expected_initial_date: "2021-05-03",
  expected_final_date: "2021-05-07",
  activity_status: "nova"
)

ActivityItem.create(
  item_name: "Abrir vala de 45cm de largura por 1m de comprimento",
  item_status: "pendente",
  activity_id: activity.id
)

ActivityItem.create(
  item_name: "Jogar camada de 10cm de brita no fundo da vala",
  item_status: "pendente",
  activity_id: activity.id
)

ActivityItem.create(
  item_name: "Montar a armadura",
  item_status: "pendente",
  activity_id: activity.id
)

ActivityItem.create(
  item_name: "Colocar a fôrma",
  item_status: "pendente",
  activity_id: activity.id
)

ActivityItem.create(
  item_name: "Fazer a concretagem",
  item_status: "pendente",
  activity_id: activity.id
)

