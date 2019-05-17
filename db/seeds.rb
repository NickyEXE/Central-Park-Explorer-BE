# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


meer = Location.create(name: "Harlem Meer", description: "At the northeast end of the park and surrounded by the North Woods, North Meadow, and Conservatory Garden, the Harlem Meer's pastoral pond is
 an absolutely dope place to go for a lazy stroll.")

 meer.landmarks.create(name: "Fort Clinton", description: "Formerly a military fortification during the Revolutionary War and War of 1812, a cannon still marks the spot overlooking the Meer, along with some picnic benches.", image: "https://forgotten-ny.com/wp-content/uploads/2017/05/fort.clinton1.jpg")
 meer.landmarks.create(name: "Conservatory Garden", description: "A six acre garden in the middle of New York City, depending on the time of year you'll feel like you're either in The Favourite or The Shining.", image: "http://assets.centralparknyc.org/images/things-to-see-and-do/conservatory-garden-l.jpg")
 meer.landmarks.create(name: "Lasker Rink and Swimming Pool", description: "Just south of Farmers Gate off the 2/3 train, Lasker Rink is a go-to for swimming during the summer and skating/hockey during the winter. It is currently cancelled though, as it is run by the Trump Organization.", image: "http://michaelminn.net/newyork/parks/central-park/lasker-rink/2004-03-07_16-09-41.jpg")
fishing = Interest.create(name: "Fishing")
wildlife = Interest.create(name: "Wildlife")
flora = Interest.create(name: "Flora")
fishing_tag = fishing.tags.create(tag: "fishing")
wildlife_tag = wildlife.tags.create(tag: "wildlife")
flora_tag = flora.tags.create(tag: "flora")

meer.create_reference_to_tag_by_name("fishing")
meer.create_reference_to_tag_by_name("wildlife")
meer.create_reference_to_tag_by_name("flora")
meer.facts.create(factoid: "Meer is Dutch for lake")
meer.facts.create(factoid: "This meer was once a brackish portion of wetland that drained into the East River.")
meer.locimages.create(url: "https://upload.wikimedia.org/wikipedia/commons/8/89/Dana_Discovery_Center%2C_Central_Park_NY.JPG", alt: "The Dana Discovery Center at the Harlem Meer")
meer.locimages.create(url: "https://upload.wikimedia.org/wikipedia/common
s/thumb/8/8b/Central_Park_New_York_October_2016_panorama_1.jpg/1200px-Central_Park_New_York_Oct
ober_2016_panorama_1.jpg", alt: "view of water at meer")
