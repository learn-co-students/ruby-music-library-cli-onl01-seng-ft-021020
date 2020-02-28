

class Genre
  include Basics::InstanceMethods
  extend Concerns::Findable
  
  attr_accessor :name
  
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
  
  def songs
    @songs
  end
  
  def artists
    result = []

    @songs.each do |song|
      
      if (result.include?(song.artist) == false)
        result << song.artist
      end
    end

    return result
    
  end
end