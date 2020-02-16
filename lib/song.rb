class Song
  attr_accessor :name, :genre, :artist
  # attr_reader :artist

  @@all = []

  def initialize(name, artist)
    @name = name
  
    
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
  
  # def artist=(artist)
  #   artist.add_song(self)
  # end
  
  def genre=()
    Genre.add_song(self)
  end
  
  def self.find_by_name(name)
    @@all.detect { |song| song.name == name }  
  end
  
end
