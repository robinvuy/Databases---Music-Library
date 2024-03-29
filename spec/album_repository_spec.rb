require 'album_repository'

RSpec.describe AlbumRepository do
  
    def reset_albums_table
      seed_sql = File.read('spec/seeds_albums.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
      connection.exec(seed_sql)
    end
    
    before(:each) do 
      reset_albums_table
    end

  it 'returns two albums' do
    repo = AlbumRepository.new
    albums = repo.all

    expect(albums.length).to eq 2
    expect(albums.first.title).to eq 'Bossanova'
    expect(albums.first.release_year).to eq '1999'
    expect(albums.first.artist_id).to eq '1'
  end

  it "returns 1st album" do
    repo = AlbumRepository.new
    albums = repo.find(1)
    expect(albums.title).to eq 'Bossanova'
    expect(albums.release_year).to eq '1999'
    expect(albums.artist_id).to eq '1'
  
  end

  it "creates and inserts one album" do
    repo = AlbumRepository.new
    
    new_album = Album.new
    new_album.title = 'Trompe le Monde'
    new_album.release_year = '1991'
    new_album.artist_id = '1'

    repo.create(new_album)
    all_albums = repo.all

    expect(all_albums).to include(new_album)
    
    
  
  end
    



end
