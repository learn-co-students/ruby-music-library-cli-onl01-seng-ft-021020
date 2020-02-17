class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  # INSTANCE METHODS

  def initialize(name, a = nil, g = nil)
    @name = name
    self.artist = a if a != nil
    self.genre = g if g != nil
  end
 
  def save
    self.class.all << self
  end

  def artist=(a)
    @artist ||= a
    a.add_song(self) if !a.songs.include?(self)
  end

  def genre=(g)
    @genre = g
    g.songs << self if !g.songs.include?(self)
  end

  # CLASS METHODS

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end

end