require_relative './concerns/findable'

class Artist
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
    new_artist = self.new(name)
    new_artist
  end
  
  def song=(song)
    self.songs << song
    song.artist = self
  end
  
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if !song.artist
      song.artist = self
    end
  end
  
  def genres
    @songs.collect { |song| song.genre }.uniq
  end
  
end
