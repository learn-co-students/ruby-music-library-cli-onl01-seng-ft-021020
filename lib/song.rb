require_relative './music_importer.rb'

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

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
    
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  # def self.new_from_filename(filename)
  #   artist, title, genre = filename.split(" - ")
  #   genre = genre.split(".").first
  #   Song.new(title, Artist.new(artist), Genre.new(genre)) if !self.find_by_name(title)
  # end

  def self.new_from_filename(filename)
    artist, title, genre = filename.split(" - ")
    genre = genre.split(".").first
    song = Song.find_or_create_by_name(title)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    # self.new_from_filename(filename).save
    self.new_from_filename(filename)
  end

end