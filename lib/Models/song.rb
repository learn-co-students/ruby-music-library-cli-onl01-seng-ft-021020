require 'pry'
class Song  
  attr_accessor  :name
  attr_reader :artist, :genre
  @@all = []
 
 def initialize(name, artist = nil, genre = nil)
  
       @name = name
      self.artist = artist if artist
      self.genre = genre if genre
  end 
  
    
      
       def genre=(genre)
         @genre = genre
       genre.songs << self unless genre.songs.include?(self)
    end 
       def artist=(artist)
                 @artist = artist 
                   artist.add_song(self)
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
        song= new(name)
        song.save
        song 
         
         end
           def self.find_by_name(name)
             all.detect{|s| s.name == name}
           end
           
    def self.find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end
    
    def self.new_from_filename(filename)
      info = filename.split(" - ")
    artist, name, genre = info[0], info[1], info[2].gsub( ".mp3" , "")

    # song = self.find_or_create_by_name(name)
    genre = Genre.find_or_create_by_name(genre)
    artist = Artist.find_or_create_by_name(artist)

    new(name,artist,genre)
       end
    def self.create_from_filename(son)
#binding.pry
    song = new_from_filename(son)
     song.save
    
    end 
  
end 


# song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

#       expect(song.name).to eq("For Love I Come")
#       expect(song.artist.name).to eq("Thundercat")
#       expect(song.genre.name).to eq("dance")
  #Associations — Song and Artist:Song #artist returns the artist of the song (song belongs to artist)