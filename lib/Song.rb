class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end
    
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    song = Song.new(name)
    song.name = name 
    song 
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")

    song_name = filename_array[1]
    artist_name = filename_array[0]
    genre_name = filename_array[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end
  
end