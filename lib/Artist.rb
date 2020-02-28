class Artist 
  extend Concerns::Findable
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    artist = Artist.new(name)
    artist.name = name 
    artist 
  end
  
  def songs
    @songs
  end
  
  def genres 
    @genres = []
    @songs.each do |song|
      if @genres.include?(song.genre)
        nil 
      else
        @genres << song.genre
      end
    end
    @genres
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist != self
    song
  end
  
end