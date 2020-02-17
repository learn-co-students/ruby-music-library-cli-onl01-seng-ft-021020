class Genre
  attr_accessor :name, :songs

  @@all = []

  # INSTANCE METHODS

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def artists
    self.songs.map{ |song| song.artist }.uniq
  end

  # CLASS METHODS

  def self.create(name)
    Genre.new(name).tap do |genre|
      genre.save
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end