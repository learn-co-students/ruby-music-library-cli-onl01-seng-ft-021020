class Artist 
  attr_accessor :name, :songs
  @@all = []  
  def initialize(name)
    @name = name
  end
   def self.all 
     @@all
   end
   def self.destroy_all
     all.clear
   end
   def save 
     @@all << self
   end 
   def self.create(name)
     
    @@all << self.new(name).save
   end 
end