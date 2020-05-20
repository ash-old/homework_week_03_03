require('pg')
require_relative('../db/sql_runner')

class Artist

attr_reader :id, :artist_name

def initialize(options)
  @id = options['id'].to_i if options['id']
  @artist_name = options['artist_name']
end

def save()
  sql = "INSERT INTO artists (artist_name) VALUES($1) RETURNING id"
  values = [@artist_name]
  returned_array = SqlRunner.run(sql, values)
  artist_hash = returned_array[0]
  @id = artist_hash['id'].to_i
end

# def album()
#     sql = "SELECT * FROM albums WHERE id = $1"
#     values = [@album_id]
#     results = SqlRunner.run(sql, values)
#     artist_data = results[0]
#     artist = Artist.new(artist_data)
#   end

def self.all()
  sql = "SELECT * FROM artists"
  pg_result = SqlRunner.run(sql)
  return pg_result.map {|artist| Album.new(artist)}
end






end
