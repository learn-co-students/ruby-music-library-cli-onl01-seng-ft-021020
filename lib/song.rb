class Song 
 
 extend Concerns::Findable
 attr_accessor :name
 attr_reader :artist, :genre
 @@all = [] 
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre !=nil
  end

  
  def save 
    @@all << self
  end 
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name) 
    song = self.new(name) 
    song.save 
    song
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end 
  
  def self.new_from_filename(file_name)
    song = file_name.split(" - ")[1]
    artist = file_name.split(" - ")[0]
    genre = file_name.split(" - ")[2].gsub(".mp3","")
    artist_obj = Artist.find_or_create_by_name(artist)
    genre_obj = Genre.find_or_create_by_name(genre)
    new(song, artist_obj, genre_obj)
  end
  
  def self.create_from_filename(file_name)
    @@all << new_from_filename(file_name)
  end 
  
end 

