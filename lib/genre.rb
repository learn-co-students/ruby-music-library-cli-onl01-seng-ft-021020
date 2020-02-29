class Genre 
 
 extend Concerns::Findable
 attr_accessor :name, :artist, :songs
 @@all = [] 
  
  def initialize(name) 
    @name = name 
    @songs = []
    save
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
    song
  end
  
  def songs
    @songs
  end 
  
  def add_song(song)
    song.genre = self unless song.genre 
    if !@songs.include?(song)
     
      @songs << song
    end 
  end
  
  def artists 
    genre_artists = []
    self.songs.collect{ |song| genre_artists << song.artist}
    genre_artists.uniq
  end 
  
end

