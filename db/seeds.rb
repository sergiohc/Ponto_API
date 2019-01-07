# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.create(name: 'Sergio Henrique',
  cpf: '07664434939',
  pis: '23212345674',
  user: User.last)

Employee.create(name: 'Leonardo Mark',
  cpf: '11114434930',
  pis: '13232345672',
  user_id: 1)

ClockInOut.create( date: Date.current,
  hour1: Time.now,
  hour2: Time.now,
  hour3: Time.now,
  hour4: Time.now,
  employee: Employee.last
)

