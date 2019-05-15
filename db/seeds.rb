# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


meer = Location.create(name: "Harlem Meer", description: "At the northeast end of the park and surrounded by the North Woods, North Meadow, and Conservatory Garden, the Harlem Meer's pastoral pond is
 an absolutely dope place to go for a lazy stroll.")

 meer.landmarks.create(name: "Fort Clinton", description: "Formerly a military fortification during the Revolutionary War and War of 1812, a cannon still marks the spot overlooking the Meer, al
 ong with some picnic benches.")

 meer.tags.create(tag: "fishing")
