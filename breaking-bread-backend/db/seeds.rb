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
  # { name: 'Boyle Heights' },
  { name: 'Burbank' },
  # { name: 'Canoga Park' },
  { name: 'Carson' },
  # { name: 'Chatsworth' },
  { name: 'Compton' },
  # { name: 'Corona' },
  # { name: 'Covina' },
  # { name: 'Crenshaw' },
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
  # { name: 'Huntington Beach' },
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
  # { name: 'Palmdale' },
  # { name: 'Paramount' },
  # { name: 'Park-Windsor Hills' },
  { name: 'Pasadena' },
  # { name: 'Playa Vista' },
  { name: 'Pomona' },
  { name: 'Santa Ana' },
  # { name: 'Santa Clarita' },
  # { name: 'Sawtelle' },
  { name: 'Sherman Oaks' },
  # { name: 'South Gate' },
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


azusa = Neighborhood.find_by(name: "Azusa")
azusa.businesses.create(name: "Keith's Kettle Corn", phone: "(626) 804-7999", website: "https://www.keithskettlecorn.com/", instagram: "@keithskettlecorn")


baldwinHills = Neighborhood.find_by(name: "Baldwin Hills")
baldwinHills.businesses.create([{
    name: "Harun Coffee",
    phone: "(323) 815-9944",
    website: "https://harunintl.com/",
    instagram: "@haruncoffee"
  },
  {
    name: "Hotville Chicken",
    phone: "(323) 792-4835",
    website: "https://www.hotvillechicken.com",
    instagram: "@hotvillechicken"
  },
  {
    name: "Post & Beam",
    phone: "(323) 299-5599",
    website: "https://postandbeamla.com/",
    instagram: "@postandbeamla"
  },
  {
    name: "Southern Girl Desserts",
    phone: "(323) 293-2253",
    website: "https://www.southerngirldesserts.com/",
    instagram: "@southerngirldesserts"
  },
  {
    name: "Yordanos Ethiopian Restaurant",
    phone: "(323) 921-4215",
    website: "https://www.yelp.com/biz/yordanos-ethiopian-restaurant-los-angeles",
    instagram: "@yordanos_ethiopian_resturant"
  }
])


bellflower = Neighborhood.find_by(name: "Bellflower")
bellflower.businesses.create(name: "Hambone's Smokehouse", phone: "(562) 920-5200", website: "http://hambonesbarandgrill.com/", instagram: "@hambones_smokehouse")


burbank = Neighborhood.find_by(name: "Burbank")
burbank.businesses.create([{
    name: "Kings Deli",
    phone: "(818) 561-4405",
    website: "https://www.kingsdeli.co/",
    instagram: "@kingsdelila"
  },
  {
    name: "Lou, The French On The Block",
    phone: "(747) 241-8205",
    website: "https://www.louthefrenchontheblock.com/",
    instagram: "@louthefrenchontheblock"
  }
])


carson = Neighborhood.find_by(name: "Carson")
carson.businesses.create([{
    name: "3Stakx Kitchen",
    phone: "(323) 474-4429",
    website: "https://www.3stakxkitchen.com/",
    instagram: "@3stakxs_kitchen"
  },
  {
    name: "Belly’s Sliders & Wings",
    phone: "(424) 366-4572",
    website: "https://www.bellysslidersandwings.com/",
    instagram: "@bellysslidersandwings"
  },
  {
    name: "Darrow's Grill",
    phone: "(424) 570-0531",
    website: "https://www.darrowsneworleansgrill.com/",
    instagram: "@darrowsgrill"
  },
  {
    name: "Fresh and Meaty Burgers",
    phone: "(424) 536-3046",
    website: "https://www.bestturkeyburgerlosangeles.com/",
    instagram: "@freshandmeatyburgers"
  },    
  {
    name: "Juice-C-Juice",
    phone: "(310) 324-8444",
    website: "https://www.gotjuices.com/",
    instagram: "@juicecjuice"
  },
  {
    name: "Ken's Ice Cream",
    phone: "(310) 324-7704",
    website: "http://kensicecream.net/",
    instagram: "@kensparlor"
  },
  {
    name: "M&M Soul Food",
    phone: "(310) 324-5317",
    website: "https://www.yelp.com/biz/m-and-m-soul-food-carson-2",
    instagram: "N/A"
  },
  {
    name: "R & R Soul Food Restaurant",
    phone: "(310) 715-6716",
    website: "https://www.randrsoulfood.com/",
    instagram: "@randrsoulfoods"
  }
])


compton = Neighborhood.find_by(name: "Compton")
compton.businesses.create([{
    name: "Billionaire Burger Boyz",
    phone: "(310) 554-4116",
    website: "https://www.billionaireburgerboyz.com/",
    instagram: "@billionaireburgerboyz"
  },
  {
    name: "Cliff's Texas Style Burritos",
    phone: "(310) 609-2755",
    website: "http://www.cliffsburritos.com/",
    instagram: "@srcliffsburritos"
  },
  {
    name: "Fish Bone Seafood",
    phone: "(310) 933-8868",
    website: "https://fishboneseafood.com/fishbone-seafood-compton/",
    instagram: "@fishbone_compton"
  },
  { 
    name: "Foster Bros",
    phone: "(213) 448-1203",
    website: "N/A",
    instagram: "@fosterbros_"
  },
  {
    name: "Fun Diggity",
    phone: "(424) 242-5799",
    website: "https://fundiggity.business.site/?utm_source=gmb&utm_medium=referral",
    instagram: "@fdfunnelcakes"
  }
    # Happy Ice	Compton	(215) 800-3965	https://happyicela.com/	@happyice
    # Johnson Brothers BBQ	Compton	(310) 933-8803	https://www.johnsonbrothersbbq.com/	@johnsonbrothersbbq
    # Patria Coffee	Compton	(323) 513-4865	https://www.patriacoffee.com/	@patriacoffee
    # Plate Of Hue	Compton	(323) 205-5283	https://www.facebook.com/pg/plateofhue/about/?ref=page_internal	@plateofhue
    # Smakk'D Refreshers & Teas	Compton	(424) 785-4212	https://www.smakkdrefreshers.com/	@smakkd_
    # Trap Kitchen	Compton	(503) 442-0748	https://www.trapkitchen.com/	@therealtrapkitchen
])