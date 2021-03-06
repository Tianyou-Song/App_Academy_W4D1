# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: 'user1')
user2 = User.create(username: 'user2')
user3 = User.create(username: 'user3')

artwork1 = Artwork.create(title: 'birth of venus', image_url: 'venus.com', artist_id: user1.id)
artwork2 = Artwork.create(title: 'mona lisa', image_url: 'lisa.com', artist_id: user2.id)
artwork3 = Artwork.create(title: 'last supper', image_url: 'supper.com', artist_id: user3.id)

ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user1.id)
ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user2.id)
ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user3.id)

ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user1.id)
ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user3.id)
