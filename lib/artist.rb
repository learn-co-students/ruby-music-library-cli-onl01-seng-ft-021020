require 'pry'
class Artist
 
 extend Concerns::Findable
 attr_accessor :name, :genre, :songs
 #attr_reader 
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
  
  def add_song(song)
    song.artist = self unless song.artist 
    if !@songs.include?(song)
      @songs << song
    end 
  end
  
  def genres 
    artist_genres = []
    self.songs.collect{ |song| artist_genres << song.genre}
    artist_genres.uniq
  end 
  
end 

