require_relative "../config/environment.rb"

class Genre 
  attr_accessor :name 
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    @genre = Genre.new(name)
    @genre.save
    @genre
  end
  
  def songs
    @songs
  end
  
  def add_songs(song)
    @songs << song 
  end
  
  def artists
    self.songs.collect{|songs| songs.artist}.uniq 
  end
end

  