# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email:"1@11.co",password:"123456")
farm = user.farms.create(name:"Hidrovegetal")
lot = farm.lots.create(name:"Lote 1",location:"zona este")
groove = Groove.create(quantity:20,lot_id: lot.id)
plague_report = groove.plague_reports.create(reportDate:"2018-05-16")
sick_plant = plague_report.sick_plants.create(location:2)