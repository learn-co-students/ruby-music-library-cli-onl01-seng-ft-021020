

class Artist
  
  include Basics::InstanceMethods
  extend Concerns::Findable
  
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    super(name)
    @songs = []
  end

  def self.all
    return @@all
  end
  
  def self.destroy_all
    @@all = []
  end
    
  def self.create(name)
    creation = new(name)
    creation.save
    return creation
  end
  
  def add_song(song)
    if(song.artist == nil)
      song.artist = self
      
    end
    
    if(@songs.include?(song) == false)
      @songs << song
    end 
  end
  
  def genres
    result = []

    @songs.each do |song|
      
      if (result.include?(song.genre) == false)
        result << song.genre
      end
    end

    return result
    
  end
  
end