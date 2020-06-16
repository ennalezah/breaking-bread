# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner'
# require 'csv'
# require 'activerecord-import/base'

DatabaseCleaner.clean_with(:truncation)

la = City.create(name: 'Los Angeles', abbrev: 'LA')

la.neighborhoods.create([
  { name: 'Alhambra' },
  # { name: 'Altadena' },
  { name: 'Anaheim' },
  # { name: 'Atwater Village' },
  { name: 'Azusa' },
  { name: 'Baldwin Hills' },
  { name: 'Bellflower' },
  # { name: 'Boyle Heights' },
  { name: 'Burbank' },
  # { name: 'Canoga Park' },
  { name: 'Carson' },
  # { name: 'Chatsworth' },
  { name: 'Compton' },
  # { name: 'Corona' },
  { name: 'Covina' },
  { name: 'Crenshaw' },
  { name: 'Culver City' },
  { name: 'Downtown' },
  { name: 'Historic Filipinotown' },
  { name: 'Echo Park' },
  { name: 'Exposition Park' },
  # { name: 'Fairfax' },
  { name: 'Gardena' },
  { name: 'Glendale' },
  # { name: 'Gramercy Park' },
  { name: 'Hawthorne' },
  { name: 'Hollywood' },
  { name: 'Huntington Beach' },
  # { name: 'Huntington Park' },
  # { name: 'Hyde Park' },
  { name: 'Inglewood' },
  # { name: 'Jefferson Park' },
  # { name: 'La Cienega Heights' },
  { name: 'Lakewood' },
  { name: 'Lancaster' },
  # { name: 'Leimert Park' },
  # { name: 'Little Ethiopia' },
  { name: 'Long Beach' },
  # { name: 'Manchester' },
  { name: 'Marina Del Ray' },
  # { name: 'MacArthur Park' },
  { name: 'Mid-City' },
  { name: 'Mid-Wilshire' },
  # { name: 'Morningside Park' },
  { name: 'North Hollywood' },
  { name: 'Palmdale' },
  { name: 'Paramount' },
  # { name: 'Park-Windsor Hills' },
  { name: 'Pasadena' },
  # { name: 'Playa Vista' },
  { name: 'Pomona' },
  { name: 'Santa Ana' },
  # { name: 'Santa Clarita' },
  { name: 'Sawtelle' },
  { name: 'Sherman Oaks' },
  { name: 'South Gate' },
  { name: 'South LA' },
  { name: 'Silver Lake' },
  { name: 'Studio City' },
  # { name: 'Sylmar' },
  # { name: 'Tarzana' },
  # { name: 'Thai Town' },
  # { name: 'Toluca Lake' },
  { name: 'Torrance' },
  # { name: 'Van Ness' },
  { name: 'Van Nuys' },
  { name: 'Watts' },
  # { name: 'West Adams' },
  # { name: 'Westchester' },
  { name: 'West Hollywood' }
  # { name: 'Windsor Hills' }
])

alhambra = Neighborhood.all.first;
alhambra.businesses.create(name: "Wilson's Bbq Rib Shack", phone: "(323) 457-0258", website: "https://www.wilsonsbbqribshack.com", instagram: "@wilsonsbbqribshack")


altadena = Neighborhood.find_by(name: "Altadena")
altadena.businesses.create([{
    name: "Little Red Hen Coffee Shop",
    phone: "(626) 791-1614",
    website: "https://www.yelp.com/biz/the-little-red-hen-coffee-shop-altadena",
    instagram: "@thelittleredhencoffeeshop"
  },
  {
    name: "UEDF Fish & Chips",
    phone: "(626) 794-0277",
    website: "https://www.yelp.com/biz/uedf-fish-and-chips-altadena",
    instagram: "N/A"
  }
])


anaheim = Neighborhood.find_by(name: "Anaheim")
anaheim.businesses.create([{
    name: "Georgia's Restaurant",
    phone: "(714) 906-1900",
    website: "https://www.georgias-restaurant.com/",
    instagram: "@georgiassoul"
  },
  {
    name: "Roscoe's Chicken and Waffles",
    phone: "(714) 823-4130",
    website: "https://www.roscoeschickenandwaffles.com/",
    instagram: "@roscoesofficial"
  }
])


atwaterVillage = Neighborhood.find_by(name: "Atwater Village");
atwaterVillage.businesses.create(name: "Chicken N Chips", phone: "(323) 922-1070", website: "https://chickennchips.com/", instagram: "@chickennchips")


azusa = Neighborhood.find_by(name: "Azusa");
azusa.businesses.create(name: "Keith's Kettle Corn", phone: "(626) 804-7999", website: "https://www.keithskettlecorn.com/", instagram: "@keithskettlecorn")

# Business.import_from_csv