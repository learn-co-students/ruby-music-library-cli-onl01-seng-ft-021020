 

class Artist 
  extend Concerns::Findable
  attr_accessor :name
  attr_reader  :songs
  
  @@all = []  
  
  
  def initialize(name)
    @name = name
    @songs = [ ]
  end
  
  
   def self.all 
     @@all
   end
   
   
   def self.destroy_all
     all.clear
   end
   
   def save 
    self.class.all << self
   end 
   
   def self.create(name)
    artist = new(name)
    artist.save
    artist
   end 
   
    def add_song(song)
   song.artist = self unless song.artist 
   songs << song unless songs.include?(song)
   end
 
 
    def genres 
      songs.collect{|son| son.genre}.uniq 
    end 
end


  # expected #<Artist:16850860> => #<Artist:0x0000000002023f58 @name="Neutral Milk Hotel", @songs=[]>
  #           got #<NilClass:8> => nil