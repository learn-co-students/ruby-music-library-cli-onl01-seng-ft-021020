class Artist
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
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist
  end
  
  def song=(song)
    self.songs << song
    song.artist = self
  end
  
  def self.find_by_name(name)
    @@all.detect { |artist| artist.name == name }  
  end
  
end
