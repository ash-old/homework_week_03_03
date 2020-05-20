require("pry")
require_relative("../models/Artist")
require_relative("../models/Album")


artist1 = Artist.new({'artist_name' => 'Nirvana'})
artist1.save()
artist2 = Artist.new({'artist_name' => 'Pearl Jam'})
artist2.save()

album1 = Album.new({'album_title' => 'Nevermind', 'genre' => 'Rock', 'artist_id' => artist1.id})
album2 = Album.new({'album_title' => 'Ten', 'genre' => 'Rock', 'artist_id' => artist2.id})
album3 = Album.new({'album_title' => 'MTV Unplugged', 'genre' => 'Rock', 'artist_id' => artist1.id})
album1.save()
album2.save()
album3.save()


album1.artist()



binding.pry
nil
