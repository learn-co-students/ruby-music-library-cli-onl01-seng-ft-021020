class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  # INSTANCE METHODS

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    song.artist ||= self
    @songs << song if !songs.include?(song)
  end

  # CLASS METHODS

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

end