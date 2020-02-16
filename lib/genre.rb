class Genre
  attr_accessor :songs
  
  @@all = []
  
  def initialize(song)
    @songs = []
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end