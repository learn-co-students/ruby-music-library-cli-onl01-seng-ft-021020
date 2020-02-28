

class Song
  
  include Basics::InstanceMethods
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    super(name)
    #@artist = artist
    self.artist = artist
    self.genre = genre
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
  
  def artist
    return @artist
  end
  
  def artist=(value)
    @artist = value
    if(value != nil)
      @artist.add_song(self)
    end 
  end
  
  def genre
    return @genre
  end
  
  def genre=(value)
    @genre = value
    if(genre != nil)
      
      if(@genre.songs.include?(self) == false)
        @genre.songs << self
      end 
    end
  end
  
  def self.find_by_name(name)
    return @@all.find{|song| song.name == name} 
  end
  
  def self.find_or_create_by_name(name)
   find = find_by_name(name)
    if (find != nil)
     return find
   else
     return create(name)
   end
  end
  
  def self.new_from_filename(filename)
    
  #  song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

    #  expect(song.name).to eq("For Love I Come")
    #  expect(song.artist.name).to eq("Thundercat")
    #  expect(song.genre.name).to eq("dance")

    info = File.basename(filename,File.extname(filename))
    info_array = info.split(" - ")
    
    name = info_array[1]
    artist = Artist.find_or_create_by_name(info_array[0])
    genre = Genre.find_or_create_by_name(info_array[2])
    
    new_song = Song.new(name, artist, genre)
    return new_song
  end
  
  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
  end
    
 
end