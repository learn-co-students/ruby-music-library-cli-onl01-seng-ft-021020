class Artist
  attr_accessor :genre, :songs
  
  @@all = []
  
  def initialize(song)
    @songs = []
  end

  def self.all
    @@all
  end

end

# When you reach these tests, make sure those setter methods are only invoked 
# if Song#initialize is called with artist and/or genre arguments. 
# Otherwise, the @artist and/or @genre properties will be initialized 
# as nil, and you'll have some unexpected consequences in both your code and the test suite.