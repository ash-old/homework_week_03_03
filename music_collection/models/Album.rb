require('pg')
require_relative('../db/sql_runner')

class Album

attr_reader :id, :album_title, :genre, :artist_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @album_title = options['album_title']
  @genre = options['genre']
  @artist_id = options['artist_id'].to_i
end

def save()
  sql = "INSERT INTO albums (album_title, genre, artist_id ) VALUES($1, $2, $3) RETURNING id"
  values = [@album_title, @genre, @artist_id]
  returned_array = SqlRunner.run(sql, values)
  album_hash = returned_array[0]
  @id = album_hash['id'].to_i
end

def self.all()
  sql = "SELECT * FROM albums"
  pg_result = SqlRunner.run(sql)
  return pg_result.map {|album| Album.new(album)}
end

def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_data = results[0]
    artist = Artist.new(artist_data)
  end







end
