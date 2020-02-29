require_relative "../config/environment.rb"

class Song 
  attr_accessor :name 
  @@all = []
  
  def initialize(name, song_artist=nil, song_genre=nil)
    @name = name 
    if song_artist != nil 
      self.artist=song_artist
    end
    if song_genre != nil
      self.genre=song_genre
    end
  end 
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    @song = Song.new(name)
    @song.save
    @song
  end
  
  def artist
    @artist
  end
  
  def artist=(song_artist)
    @artist = song_artist
    song_artist.add_song(self)
  end
  
  def genre 
    @genre 
  end
  
  def genre=(song_genre)
    @genre = song_genre
    if !song_genre.songs.include?(self)
      song_genre.add_songs(self) 
    end
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      Song.create(name)
    end
  end
    
  def self.new_from_filename(filename)
    @song_name = filename.split(" - ")[1]
    @song = self.find_or_create_by_name(@song_name)
    @artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    @song.artist= @artist
    @genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    @song.genre = @genre 
    @song
  end
  
  def self.create_from_filename(filename)
    @song = self.new_from_filename(filename)
    @song 
  end
    
    
end

# describe "Song" do
#   describe ".new_from_filename" do
#     it "initializes a song based on the passed-in filename" do
#       song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

#       expect(song.name).to eq("For Love I Come")
#       expect(song.artist.name).to eq("Thundercat")
#       expect(song.genre.name).to eq("dance")
#     end

#     it "invokes the appropriate Findable methods so as to avoid duplicating objects" do
#       artist = Artist.create("Thundercat")
#       genre = Genre.create("dance")

#       expect(Artist).to receive(:find_or_create_by_name).and_return(artist)
#       expect(Genre).to receive(:find_or_create_by_name).and_return(genre)

#       song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

#       expect(song.artist).to be(artist)
#       expect(song.genre).to be(genre)
#     end
#   end

#   describe ".create_from_filename" do
#     it "initializes and saves a song based on the passed-in filename" do
#       song = Song.create_from_filename("Thundercat - For Love I Come - dance.mp3")

#       expect(Song.all.last.genre.name).to eq("dance")
#     end

#     it "invokes .new_from_filename instead of re-coding the same functionality" do
#       expect(Song).to receive(:new_from_filename).and_return(double(save: true))

#       Song.create_from_filename("Thundercat - For Love I Come - dance.mp3")
#     end
#   end
# end

