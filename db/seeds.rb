# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = Unidade.create(nome: "2Cia Timbo")

User.create(matricula: '929905', nome: 'SD Alexandre', unidade: u, password: '123', password_confirmation: '123', admin: true)