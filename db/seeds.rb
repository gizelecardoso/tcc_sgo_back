# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = Company.create(
  company_code: 'C0001',
  company_name: 'Teste',
  company_branch: 'Teste'
)

role = Role.create(
  role_code: "R0001",
  role_name: "Mestre de Obras",
  role_description: "Responsavel por Gerenciar profissionais que executam as tarefas da Obra.",
  role_category: 'encarregado'
)

Official.create(
  official_code: "O0001",
  official_name: "José Carlos",
  login_name: "jose.carlos",
  password: "sgo1234567897",
  role_id: role.id,
  company_id: company.id
)
