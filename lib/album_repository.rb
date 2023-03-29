require_relative './album'

class AlbumRepository  
  def all # Selecting all records # No arguments
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'  # Executes the SQL query: # SELECT id, title, release_year, artist_id FROM albums; #returns array of album objects
    result_set = DatabaseConnection.exec_params(sql, [])

    albums = []
    result_set.each do |record|
      album = Album.new
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']
    
      albums << album
    end

    return albums
  end
end