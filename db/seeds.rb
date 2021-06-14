# frozen_string_literal: true

company = Company.create(
  company_code: 'C0001',
  company_name: 'Construtora SGO',
  company_branch: 'Incorporadora'
)

company2 = Company.create(
  company_code: 'C0002',
  company_name: 'Terceirizados Construções LTDA',
  company_branch: 'Construções'
)

company3 = Company.create(
  company_code: 'C0003',
  company_name: 'Terceirizados Marcenaria LTDA',
  company_branch: 'Marcenaria'
)

role = Role.create!(
  role_code: 'R0001',
  role_name: 'Mestre de Obras',
  role_description: 'Responsavel por Gerenciar profissionais que executam as tarefas da Obra.',
  role_category: 'encarregado'
)

role1 = Role.create!(
  role_code: 'R0002',
  role_name: 'Pedreiro(a)',
  role_description: 'Responsavel pela execução de atividades gerais da obra.',
  role_category: 'oficial'
)

role2 = Role.create!(
  role_code: 'R0003',
  role_name: 'Engenheiro(a)',
  role_description: 'Responsavel por Gerenciar a obra como um todo.',
  role_category: 'administrador'
)

role3 = Role.create!(
  role_code: 'R0004',
  role_name: 'Encarregado(a)',
  role_description: 'Responsavel por Gerenciar profissionais que executam as tarefas da Obra.',
  role_category: 'encarregado'
)

role4 = Role.create!(
  role_code: 'R0005',
  role_name: 'Marceneiro(a)',
  role_description: 'Responsavel pela execução de atividades gerais da obra.',
  role_category: 'oficial'
)

official = Official.create!(
  official_code: 'O0001',
  official_name: 'José Carlos',
  login_name: 'jose.carlos',
  cellphone: '5511983228785',
  password: '1234',
  role_id: role.id,
  company_id: company2.id
)

Official.create!(
  official_code: 'O0002',
  official_name: 'Claudia Goncalves',
  login_name: 'claudia.goncalves',
  cellphone: '5511983228781',
  password: '1234',
  role_id: role1.id,
  company_id: company2.id,
  clerk_id: official.id
)

Official.create!(
  official_code: 'O0003',
  official_name: 'Flavio Cardoso',
  login_name: 'flavio.cardoso',
  cellphone: '5511983228783',
  password: '1234',
  role_id: role2.id,
  company_id: company.id
)

official1 = Official.create!(
  official_code: 'O0004',
  official_name: 'Roberta Pereira',
  login_name: 'roberta.pereira',
  cellphone: '5511983228783',
  password: '1234',
  role_id: role3.id,
  company_id: company3.id
)

Official.create!(
  official_code: 'O0005',
  official_name: 'Fernando Silva',
  login_name: 'fernando.silva',
  cellphone: '5511983228783',
  password: '1234',
  role_id: role4.id,
  company_id: company3.id,
  clerk_id: official1.id
)

activity = Activity.create!(
  activity_code: 'A0001',
  activity_name: 'Fundação Sapata Corrida - SPC01',
  activity_description: 'Execução da Sapata SPC01',
  expected_initial_date: '12-06-2021',
  expected_final_date: '18-06-2021',
  activity_status: 'nova'
)

ActivityItem.create(
  item_name: 'Abrir vala de 45cm de largura por 1m de comprimento',
  item_status: 'pendente',
  activity_id: activity.id
)

ActivityItem.create(
  item_name: 'Jogar camada de 10cm de brita no fundo da vala',
  item_status: 'pendente',
  activity_id: activity.id
)

ActivityItem.create(
  item_name: 'Montar a armadura',
  item_status: 'pendente',
  activity_id: activity.id
)

ActivityItem.create(
  item_name: 'Colocar a fôrma',
  item_status: 'pendente',
  activity_id: activity.id
)

ActivityItem.create(
  item_name: 'Fazer a concretagem',
  item_status: 'pendente',
  activity_id: activity.id
)

ActivityItem.create(
  item_name: 'Fazer a concretagem',
  item_status: 'pendente',
  activity_id: activity.id
)

Activity.create!(
  activity_code: 'A0002',
  activity_name: 'Fundação Sapata Corrida - Atrasada',
  activity_description: 'Execução da Sapata Atrasada',
  expected_initial_date: '07-06-2021',
  expected_final_date: '08-06-2021',
  activity_status: 'nova'
)

activity_finished = Activity.create!(
  activity_code: 'A0003',
  activity_name: 'Fundação Sapata Corrida - Concluida',
  activity_description: 'Execução da Sapata Concluida',
  expected_initial_date: '31-05-2021',
  expected_final_date: '07-06-2021',
  activity_status: 'nova',
  official_id: official.id
)

activity_finished.update(activity_status: 'pendente')
activity_finished.update(activity_status: 'executando', initial_date: Date.new(2021, 5, 31))
activity_finished.update(activity_status: 'finalizada', final_date: (Date.new(2021, 5, 31) + 7.days))

ActivityItem.create(
  item_name: 'Item 1',
  item_status: 'finalizado',
  activity_id: activity_finished.id,
  created_at: DateTime.current - 1.days,
  finished_date: DateTime.current + 1.days
)

ActivityItem.create(
  item_name: 'Item 2',
  item_status: 'finalizado',
  activity_id: activity_finished.id,
  created_at: DateTime.current - 1.days,
  finished_date: DateTime.current + 3.days
)

ActivityItem.create(
  item_name: 'Item 3',
  item_status: 'finalizado',
  activity_id: activity_finished.id,
  created_at: DateTime.current - 1.days,
  finished_date: DateTime.current + 3.days
)

ActivityItem.create(
  item_name: 'Item 4',
  item_status: 'finalizado',
  activity_id: activity_finished.id,
  created_at: DateTime.current - 1.days,
  finished_date: DateTime.current + 4.days
)

ActivityItem.create(
  item_name: 'Item 5',
  item_status: 'finalizado',
  activity_id: activity_finished.id,
  created_at: DateTime.current - 1.days,
  finished_date: DateTime.current + 4.days
)

ActivityItem.create(
  item_name: 'Item 6',
  item_status: 'finalizado',
  activity_id: activity_finished.id,
  created_at: DateTime.current - 1.days,
  finished_date: DateTime.current + 7.days
)
