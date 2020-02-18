require_relative './concerns/findable'

class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    
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
    new_genre = self.new(name)
    new_genre
  end
  
  def song=(song)
    self.songs << song
    song.artist = self
  end
  
  def self.find_by_name(name)
    @@all.detect { |genre| genre.name == name }  
  end
  
  def artists
    @songs.collect { |song| song.artist }.uniq
    
  end
  
end