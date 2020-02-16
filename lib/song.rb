class Song
  attr_accessor :name, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    
    if !artist && !genre
      self.genre = genre
      self.artist = artist
    end

    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def create(name)
    new_song = self.new(name)
    @@all << new_song
  end
  
  def artist=(artist)
    self.artist = artist
    artist.songs << self
  end

  def genre=(genre)
    self.genre = genre
    if !genre.songs.detect { |song| song == self }
     genre.songs << self
    end
  end

  def find_by_name(name)
    self.select { |song| song.name == name }
  end

  def find_or_create_by_name(name)
    if self.detect {|song| song.name == name}
      return song
    else
      self.create(name)
    end
  end
  
  def self.new_from_filename(filename)
    
  end
  
  def self.create_from_filename(filename)
  
  end

end