# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Dir.glob(`#{Rails.root}/db/seeds/*.rb`).each { |f| require f}
connection = ActiveRecord::Base.connection()

file_array = ["Columbus_Circle_-_Southwest_Park-polygon.shp", "Conservatory_Water-polygon.shp", "The_Pond-polygon.shp", "Harlem_Meer-polygon.shp", "The_Lake_South_Shore-polygon.shp", "The_Mall-polygon.shp"]

# not yet built out ["Cedar_Hill-polygon.shp", "Sheep_Meadow-polygon.shp", "The_Ramble-polygon.shp"]

file_array.each do |file|
  shp_sql = `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{Rails.root.join('db', 'shapefiles', file)} locations_ref`
  connection.execute "drop table if exists locations_ref"
  connection.execute shp_sql
  connection.execute <<-SQL
      insert into locations(name, geom, created_at, updated_at)
        select name, geom, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP from locations_ref
  SQL
  connection.execute "drop table locations_ref"
end


cheese = User.create(username: "The Cheese", password: "123")

meer = Location.find_by(name: "Harlem Meer")
meer.update(description: "At the northeast end of the park and surrounded by the North Woods, North Meadow, and Conservatory Garden, the Harlem Meer's pastoral pond is
 an absolutely dope place to go for a lazy stroll.")
pond = Location.find_by(name: "The Pond")
pond.update(description: "The southeast corner of the park is often the most crowded with tourists, but sports a gorgeous park, some great activites, and occasionally, one really hot duck.")
meer.landmarks.create(name: "Fort Clinton", description: "Formerly a military fortification during the Revolutionary War and War of 1812, a cannon still marks the spot overlooking the Meer, along with some picnic benches.", image: "https://forgotten-ny.com/wp-content/uploads/2017/05/fort.clinton1.jpg")
meer.landmarks.create(name: "Conservatory Garden", description: "A six acre garden in the middle of New York City, depending on the time of year you'll feel like you're either in The Favourite or The Shining.", image: "http://assets.centralparknyc.org/images/things-to-see-and-do/conservatory-garden-l.jpg")
meer.landmarks.create(name: "Lasker Rink and Swimming Pool", description: "Just south of Farmers Gate off the 2/3 train, Lasker Rink is a go-to for swimming during the summer and skating/hockey during the winter. It is currently cancelled though, as it is run by the Trump Organization.", image: "http://michaelminn.net/newyork/parks/central-park/lasker-rink/2004-03-07_16-09-41.jpg")
meer.locimages.create(url: "https://www.centralpark.com/downloads/2613/download/fishing-in-the-meer.jpe?cb=783665e2e86dabe11fdbe675f24e26c4&w=640", alt: "Fishing at the Harlem Meer")


fishing = Interest.create(name: "Fishing")
wildlife = Interest.create(name: "Wildlife")
flora = Interest.create(name: "Flora")
history = Interest.create(name: "History")
art = Interest.create(name: "Art")
architecture = Interest.create(name: "Architecture")
kids = Interest.create(name: "Kids")
hiking = Interest.create(name: "Hiking")
strolling = Interest.create(name: "Strolling")
fishing_tag = fishing.tags.create(tag: "fishing")
wildlife_tag = wildlife.tags.create(tag: "wildlife")
flora_tag = flora.tags.create(tag: "flora")
history_tag = history.tags.create(tag: "history")
architecture_tag = architecture.tags.create(tag: "architecture")
kids_tag = kids.tags.create(tag: "kids")
art_tag = art.tags.create(tag: "art")
hiking_tag = hiking.tags.create(tag: "hiking")
strolling_tag = strolling.tags.create(tag: "strolling")
# Meer
# create_reference_to_tag_by_nameuser_id_and_review(tag, id, review)
meer.create_reference_to_tag_by_name_user_id_and_review("fishing", cheese.id, "In addition to the turtles, there's several excellent places for catch and release.")
meer.create_reference_to_tag_by_name_user_id_and_review("wildlife", cheese.id, "It's just turtles all the way down.")
meer.create_reference_to_tag_by_name_user_id_and_review("flora", cheese.id, "Check out the conservatory garden!")
meer.facts.create(factoid: "Meer is Dutch for lake")
meer.facts.create(factoid: "This meer was once a brackish portion of wetland that drained into the East River.")
meer.locimages.create(url: "https://upload.wikimedia.org/wikipedia/commons/8/89/Dana_Discovery_Center%2C_Central_Park_NY.JPG", alt: "The Dana Discovery Center at the Harlem Meer")
meer.locimages.create(url: "https://upload.wikimedia.org/wikipedia/common
s/thumb/8/8b/Central_Park_New_York_October_2016_panorama_1.jpg/1200px-Central_Park_New_York_Oct
ober_2016_panorama_1.jpg", alt: "view of water at meer")
# Pond
pond.create_reference_to_tag_by_name_user_id_and_review("kids", cheese.id, "With the Central Park Zoo here as well as rocks for climbing, this is a great place for kids.")
pond.create_reference_to_tag_by_name_user_id_and_review("history", cheese.id, "Nobody burns down Georgia like Sherman.")
pond.create_reference_to_tag_by_name_user_id_and_review("wildlife", cheese.id, "Two words: Hot Duck.")
pond.facts.create(factoid: "The Pond is one of Central Park's seven naturalistic water bodies.")
pond.facts.create(factoid: "The Pond holds Hallett Nature Sanctuary, a wooded promontory with a 3.5-acre ecosystem.")
pond.locimages.create(url: "http://assets.centralparknyc.org/images/things-to-see-and-do/pond-l.jpg", alt: "pond with view of Gapstow Bridge")
pond.locimages.create(url: "https://static01.nyt.com/images/2018/11/02/business/01XP-DUCK/31XP-DUCK-videoSixteenByNine3000.jpg", alt: "Central Park's legendary Hot Duck")
pond.landmarks.create(name: "Central Park Zoo", description: "A zoo, plus a petting zoo, in the heart of the city. Come for the seals, stay for the incredibly energetic red pandas. NY 12th Congressional District Representative Carolyn Maloney has been pushing to get pandas in here for years.", image: "https://c532f75abb9c1c021b8c-e46e473f8aadb72cf2a8ea564b4e6a76.ssl.cf5.rackcdn.com/2016/10/20/9kn6or4r6j_cp_photo_sg_large.jpg")
pond.landmarks.create(name: "Wollman Rink", description: "Can you name a more iconic (or expensive) place to skate in New York City? ...Apart from Rockefeller Center.", image: "https://upload.wikimedia.org/wikipedia/commons/6/66/WollmanRink.jpg")
pond.landmarks.create(name: "Grand Army Plaza", description: "If you want to pay your respects to the guy who absolutely trashed the South, there's a giant statue of General William Tecumseh Sherman at the Southeast corner of the park.", image: "http://assets.centralparknyc.org/images/things-to-see-and-do/Sherman-750.jpg")
pond.landmarks.create(name: "Statues of Latin American Leaders", description: "If you want to check out a statue of Simón Bolívar or General José de San Martín, walk along the Southern end of the park.", image: "https://static.wixstatic.com/media/99078f_7faf7be9a7bb440380f8aad14b70e176~mv2_d_1900_1267_s_2.jpg")
pond.landmarks.create(name: "Horse Riding", description: "If you want to waste money like a tourist, Mayor Bill DeBlasio was unsuccessful on his promise to get the horses out of Central Park.", image: "https://www.centralpark.com/downloads/7996/download/Horse%20Carriage%20riders.JPG?cb=c646d57e74c95949370a4b474b132b4e&w=640")


columbus = Location.find_by(name: "Columbus Circle - Southwest Park")
columbus.update(description: "The Southwest corner of the park has walking paths to get lost in and parks and attractions for kids")
columbus.landmarks.create(name: "Summit Rock", description: "The highest natural elevation in Central Park, this is a great place to climb up and get a view.", image: "https://www.centralpark.com/downloads/8305/download/summit-rock1.jpg?cb=91f112082dc29141d32bcb6a0438a3fb&w=2048")
columbus.landmarks.create(name: "Central Park Carousel", description: "An iconic carousel, this is a great place to bring kids on the way to Sheep Meadow.", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Central_Park_Carousel_snow_jeh.JPG/1920px-Central_Park_Carousel_snow_jeh.JPG")
columbus.landmarks.create(name: "Heckscher Playground", description: "This fountain heavy playground is great for burning off kids' energy.", image: "http://assets.centralparknyc.org/images/things-to-see-and-do/heckscher-playground-l.jpg")
columbus.landmarks.create(name: "Columbus Circle", description: "At the Southwest corner of the park, a giant statue of Columbus sits in the center of malls, skateboarders, fountains, and often a holiday market.", image: "https://theknickerbocker.com/wp-content/uploads/2017/02/Columbus-Circle-NYC-Midtown-Guide-Knickerbocker-Hotel.jpg")
columbus.create_reference_to_tag_by_name_user_id_and_review("hiking", cheese.id, "This is a great part of the park to get lost in.")
columbus.create_reference_to_tag_by_name_user_id_and_review("kids", cheese.id, "If you're going to the carousel, watch out. Your kid will not leave without a plastic sword.")
columbus.facts.create(factoid: "The Central Park Carousel heavily featured in Catcher in the Rye.")
columbus.locimages.create(url: "http://assets.centralparknyc.org/images/things-to-see-and-do/greyshot-arch-l.jpg", alt: "Greyshot Arch")
columbus.locimages.create(url: "http://www.starrwhitehouse.com/wp-content/uploads/2018/04/DSC02953-1.jpg", alt: "Summit Rock")

mall = Location.find_by(name: "The Mall")
mall.update(description: "The only formalistic section of Central Park, this iconic walk leading from the Literary Walk to Bethesda Fountain was a favored place for the rich to mingle with the lower classes in an afternoon stroll at the the turn of the 20th century.")
mall.landmarks.create(name: "Literary Walk", description: "A statuary devoted to the great figures of literature, it contains statues of William Shakespeare, Sir Walter Scott, Robert Burns, and more.", image: "https://www.nycgo.com/images/venues/2975/literary-walk-will-steacy-8__x_large.jpg")
mall.landmarks.create(name: "Balto Statue", description: "A statue to the dog hero of Nome, just visiting it gets you within two degrees of Kevin Bacon (the Disney film Balto, which he starred in, ends with a shot of this statue).", image: "https://www.centralpark.com/downloads/7892/download/Balto.jpg?cb=fc63c0c9515ce5c7d341e9da08f89ec4&w=640")
mall.landmarks.create(name: "Rumsey Playfield", description: "The site of numerous events including the SummerStage event festival, this is a great place to fight for a spot to see Shakespeare.", image: "https://www.centralpark.com/downloads/5626/download/summerstage.jpg.jpe?cb=783665e2e86dabe11fdbe675f24e26c4")
mall.landmarks.create(name: "307th Infantry Regiment Memorial Grove", description: "The 307th Infantry Regiment Memorial Grove is an area dedicated to the memory of soldiers who gave their lives during World War I. Following the war, several young trees were planted in the grove- one for each of the Regiment’s companies. Each tree was marked with a plaque containing the names of men in that company who died in battle.", image: "http://assets.centralparknyc.org/images/things-to-see-and-do/307-infantry-memorial-grove.jpg")
mall.create_reference_to_tag_by_name_user_id_and_review("kids", cheese.id, "A statue to a dog in a Disney movie. This is simply the best way to a kid's heart.")
mall.create_reference_to_tag_by_name_user_id_and_review("history", cheese.id, "The Memorial Grove is a classy and understated thing to stumble into.")
mall.create_reference_to_tag_by_name_user_id_and_review("strolling", cheese.id, "Love strolling down the mall feeling like old timey 5th Avenue aristocracy.")
mall.create_reference_to_tag_by_name_user_id_and_review("art", cheese.id, "Murdered a guy for Shakespeare in the Park tickets.")
mall.facts.create(factoid: "Shakespeare's roots run deep in this area. An early fixture of New York City entertainment, the infamous Astor Place Riots were initially kicked off due to a feud between two Shakespearean actors.")
mall.facts.create(factoid: "The Mall is the only formalistic section of Central Park, which otherwise strived towards a naturalism in its design.")
mall.locimages.create(url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/The_Mall,_Central_Park,_June_2000.JPG/800px-The_Mall,_Central_Park,_June_2000.JPG", alt: "The Mall in early fall.")
mall.locimages.create(url: "http://assets.centralparknyc.org/images/things-to-see-and-do/shakespeare-l.jpg", alt: "Shakespeare's statue in the Literary Walk")

lake = Location.find_by(name: "The Lake (South Shore)")
lake.update(description: "The Southern end of Central Park's Lake hosts some of Central Park's most iconic attractions, including Strawberry Fields and the Bethesda Fountain and Terrace")
lake.landmarks.create(name: "Bethesda Mall and Terrace", description: "Centered around the Angel of the Waters statue, this classic fountain and terrace serves as the location for the ending of John Wick 2", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Angel_of_the_Waters_Fountain_and_Bethesda_Terrace%2C_Central_Park%2C_NYC.jpg/1920px-Angel_of_the_Waters_Fountain_and_Bethesda_Terrace%2C_Central_Park%2C_NYC.jpg")
lake.landmarks.create(name: "Strawberry Fields", description: "A memorial to John Lennon, the entrance to this field at 72nd Street sits right by where the Beatle was murdered outside of his home.", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/2960-Central_Park-Strawberry_Fields.JPG/1920px-2960-Central_Park-Strawberry_Fields.JPG")
lake.landmarks.create(name: "Loeb Boathouse", description: "In addition to being a great spot to rent a boat, this boathouse sports a bar for drinking over the pond.", image: "http://onthesetofnewyork.com/locations/whenharrymetsally/Whenharrymetsally109.jpg")
lake.facts.create(factoid: "The Bethesda fountain was a popular gathering place for the Hair generation before becoming a notorious drug spot in the 1970s.")
lake.facts.create(factoid: "The Loeb Boathouse is where Carrie Fisher pulls out her rolodex in When Harry Met Sally to try to find Sally a man.")
lake.create_reference_to_tag_by_name_user_id_and_review("architecture", cheese.id, "That bridge tho.")
lake.create_reference_to_tag_by_name_user_id_and_review("strolling", cheese.id, "This is simply one of my favorite places to walk.")
lake.create_reference_to_tag_by_name_user_id_and_review("kids", cheese.id, "Trying to get my kid into the Beatles by bringing her to the place where John Lennon was shot.")
lake.locimages.create(url: "https://thenypost.files.wordpress.com/2015/08/boathouse-e1524795555719.jpg?quality=90&strip=all&w=618&h=410&crop=1", alt: "The Loeb Boathouse")
lake.locimages.create(url: "https://ephemeralnewyork.files.wordpress.com/2009/05/bethesdafountain.jpg", alt: "Bethesda Fountain")
lake.locimages.create(url: "https://www.centralpark.com/downloads/3396/download/strawberry-fields.jpe?cb=19e288a218f8d4023ee173a221087d2d&w=640", alt: "Strawberry Fields")
lake.locimages.create(url: "https://www.straitstimes.com/sites/default/files/styles/article_pictrure_780x520_/public/articles/2015/10/10/lennon10.jpg?itok=htCiB-Ov&timestamp=1444421248", alt: "Imagine mosaic on Lennon's 75th birthday.")

water = Location.find_by(name: "Conservatory Water")
water.update(description: "Inspired by the design of the Grand Basin model boat pond in Paris’ Luxembourg Gardens, Conservatory Water was created by Frederick Law Olmsted and Calvert Vaux as a place where children and adults alike could experience the pleasure of boating.")
water.landmarks.create(name: "Model Boat Pond", description: "Overlooked by Kerbs Boathouse, visitors can bring or rent a model boat to cruise along a pond featured in many childrens' movies. It's also open for ice skating in the winter.", image: "https://live.staticflickr.com/5296/5542816184_600688df0d_b.jpg")
water.landmarks.create(name: "Alice in Wonderland Sculpture", description: "An 11 foot tall bronze sculpture of Alice and her friends, this sculture is actually approved for climbing by the park.", image: "https://www.centralpark.com/downloads/5135/download/alice.jpe?cb=adffc2e95381fc3159eb65b17097d5f8&w=1800&h=")
water.landmarks.create(name: "Hans Christian Andersen Monument", description: "Central Park's Hans Christian Andersen statue was erected in 1956 to commemorate the author's 150th birthday. The large, bronze statue depicts Andersen seated upon a granite bench, reading from his book The Ugly Duckling. Sculpted by Georg John Lober, this children's statue is meant to be climbed on and is a popular attraction for kids.", image: "https://www.centralpark.com/downloads/1748/download/hans-christian-anderson.jpe?cb=783665e2e86dabe11fdbe675f24e26c4&w=800&h=")
water.facts.create(factoid: "The Model Boat Pond features in the film Stuart Little.")
water.create_reference_to_tag_by_name_user_id_and_review("kids", cheese.id, "My kid yelled 'just like Stuart Little!' while pointing at a rat that crossed us on the way to the Model Boat Pond.")
water.create_reference_to_tag_by_name_user_id_and_review("art", cheese.id, "Got kicked out of the Met for touching sculptures, and then I came here and it was entirely legal. Exciting!")
water.create_reference_to_tag_by_name_user_id_and_review("architecture", cheese.id, "They really don't make buildings the way they used to, do they?")
water.locimages.create(url: "https://www.centralpark.com/downloads/1995/download/conservatory-water.jpe?cb=1c0c259b0b32ab1de90a5a84c9ac0c69&w=1200", alt: "Boat pond with view of skyline")
water.locimages.create(url: "http://assets.centralparknyc.org/images/things-to-see-and-do/kerbs-l.jpg", alt: "Kerbs Boathouse")
