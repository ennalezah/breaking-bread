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
  { name: 'Altadena' },
  { name: 'Anaheim' },
  { name: 'Atwater Village' },
  { name: 'Azusa' },
  { name: 'Baldwin Hills' },
  { name: 'Bellflower' },
  { name: 'Boyle Heights' },
  { name: 'Burbank' },
  { name: 'Canoga Park' },
  { name: 'Carson' },
  { name: 'Chatsworth' },
  { name: 'Compton' },
  { name: 'Corona' },
  { name: 'Covina' },
  { name: 'Crenshaw' },
  { name: 'Culver City' },
  { name: 'Downtown' },
  { name: 'Historic Filipinotown' },
  { name: 'Echo Park' },
  { name: 'Exposition Park' },
  { name: 'Fairfax' },
  { name: 'Gardena' },
  { name: 'Glendale' },
  { name: 'Gramercy Park' },
  { name: 'Hawthorne' },
  { name: 'Hollywood' },
  { name: 'Huntington Beach' },
  { name: 'Huntington Park' },
  { name: 'Hyde Park' },
  { name: 'Inglewood' },
  { name: 'Jefferson Park' },
  { name: 'La Cienega Heights' },
  { name: 'Lakewood' },
  { name: 'Lancaster' },
  { name: 'Leimert Park' },
  { name: 'Little Ethiopia' },
  { name: 'Long Beach' },
  { name: 'Manchester' },
  { name: 'Marina Del Ray' },
  { name: 'MacArthur Park' },
  { name: 'Mid-City' },
  { name: 'Mid-Wilshire' },
  { name: 'Morningside Park' },
  { name: 'North Hollywood' },
  { name: 'Palmdale' },
  { name: 'Paramount' },
  { name: 'Park-Windsor Hills' },
  { name: 'Pasadena' },
  { name: 'Playa Vista' },
  { name: 'Pomona' },
  { name: 'Santa Ana' },
  { name: 'Santa Clarita' },
  { name: 'Sawtelle' },
  { name: 'Sherman Oaks' },
  { name: 'South Gate' },
  { name: 'South LA' },
  { name: 'Silver Lake' },
  { name: 'Studio City' },
  { name: 'Sylmar' },
  { name: 'Tarzana' },
  { name: 'Thai Town' },
  { name: 'Toluca Lake' },
  { name: 'Torrance' },
  { name: 'Van Ness' },
  { name: 'Van Nuys' },
  { name: 'Watts' },
  { name: 'West Adams' },
  { name: 'Westchester' },
  { name: 'West Hollywood' },
  { name: 'Windsor Hills' }
])

# alhambra = Neighborhood.all.first;

# alhambra.businesses.create(name: "Wilson's Bbq Rib Shack", phone: "(323) 457-0258", website: "https://www.wilsonsbbqribshack.com", instagram: "@wilsonsbbqribshack")

Business.import_from_csv