require_relative './concerns/findable'

class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    
    if artist
      self.artist = artist
    end
    
    if genre
      self.genre = genre
    end
  
    save
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song
  end
  
  def artist=(artist)
    artist.add_song(self) unless artist.songs.include?(self)
    @artist = artist
  end
  
  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end
  
end