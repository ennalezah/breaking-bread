# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# City.create([{ name: 'Los Angeles', abbrev: 'LA' }, { name: 'San Francisco', abbrev: 'SF' }])

# Neighborhood.create([{ name: 'Alhambra', city_id: 1 }, { name: 'Altadena', city_id: 1 }])

Business.create([{
                  name: "Wilson's Bbq Rib Shack", phone: "(323) 457-0258", website: "https://www.wilsonsbbqribshack.com", instagram: "@wilsonsbbqribshack", neighborhood_id: 1
                 }, 

                 {
                  name: "Little Red Hen Coffee Shop", phone: "(626) 791-1614" , website: "https://little-red-hen-coffee-shop.hub.biz/?fbclid=IwAR1MZtXbf2HM5eY6W5hX91uaCIFxG1QcAhHpu235BwavmVMhjEzPmEYDPFM" , instagram: "@thelittleredhencoffeeshop", neighborhood_id: 2
                 }])




