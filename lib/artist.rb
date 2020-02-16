class Artist
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
  
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    song.artist = self
  end
  
end
