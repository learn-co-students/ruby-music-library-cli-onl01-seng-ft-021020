class Genre
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
    genre = Genre.new(name)
    genre.name = name 
    genre
  end
  
  def songs
    @songs
  end
  
  def artists
    songs.collect {|song| song.artist}.uniq
  end
  
end