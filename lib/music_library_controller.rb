require_relative "../config/environment.rb"
require "pry"
class MusicLibraryController
  
  def initialize(path='./db/mp3s')
  @path = path
  @music_importer = MusicImporter.new(path)
  @music_importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    @input = gets.chomp
    while @input != 'exit'
      if @input == "list songs"
        self.list_songs
      elsif @input == "list artists"
        self.list_artists
      elsif @input == "list genres"
        self.list_genres
      elsif @input == "list artist"
        self.list_songs_by_artist
      elsif @input == "list genre"
        self.list_songs_by_genre
      elsif @input == "play song"
        self.play_song
      end
      @input = gets.chomp
    end 
  end
  
  def list_songs
    i = 0
    @sorted_songs = Song.all
    @sorted_songs = @sorted_songs.sort{ |a, b| a.name <=> b.name }
    while i < @sorted_songs.length
    puts "#{i+1}. #{@sorted_songs[i].artist.name} - #{@sorted_songs[i].name} - #{@sorted_songs[i].genre.name}"
      i += 1 
    end
  end
  
  def list_artists
    i =0
    @sorted_artists = Artist.all.sort{ |a, b| a.name <=> b.name}
    while i < @sorted_artists.length
      puts "#{i+1}. #{@sorted_artists[i].name}"
      i += 1 
    end
  end
  
  def list_genres
    i =0
    @sorted_genres = Genre.all.sort{ |a, b| a.name <=> b.name}
    while i < @sorted_genres.length
      puts "#{i+1}. #{@sorted_genres[i].name}"
      i += 1 
    end
  end
  
  def list_songs_by_artist
    i = 0
    puts "Please enter the name of an artist:"
    @input = gets.chomp
    if !Song.all.select{|song| song.artist.name == @input} == false
      @song_by_artist = Song.all.select{|song| song.artist.name == @input}
      @song_by_artist = @song_by_artist.sort{|a, b| a.name <=> b.name}
      while i < @song_by_artist.length 
        puts "#{i+1}. #{@song_by_artist[i].name} - #{@song_by_artist[i].genre.name}"
        i += 1 
      end 
    end 
  end
  
  def list_songs_by_genre
    i=0
    puts "Please enter the name of a genre:"
    @input = gets.chomp
    if !Song.all.select{|song| song.genre.name == @input} == false
      @song_by_genre = Song.all.select{|song| song.genre.name == @input}
      @song_by_genre = @song_by_genre.sort{|a, b| a.name <=> b.name}
      while i < @song_by_genre.length 
        puts "#{i+1}. #{@song_by_genre[i].artist.name} - #{@song_by_genre[i].name}"
        i += 1 
      end 
    end 
  end
  
  
  def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
  
  # def play_song
  #   #puts "Which song number would you like to play?"
  #   #self.list_songs
  #   @input = gets.chomp
  #   @sorted_songs2 = Song.all
  #   @sorted_songs2 = @sorted_songs2.sort{ |a, b| a.name <=> b.name }
  #   @input = @input.to_i
  #   if (@input-1) < @sorted_songs2.length && @input != 0
  #     puts "Playing #{@sorted_songs2[@input-1].name} by #{@sorted_songs2[@input-1].artist.name}"
  #     puts "Which song number would you like to play?"
  #   else
  #     puts "Which song number would you like to play?"
  #   end
  # end
  
end


# require "spec_helper"

# describe "MusicLibraryController - CLI Commands" do
#   let(:music_library_controller) { MusicLibraryController.new("./spec/fixtures/mp3s") }

#   describe "'list songs'" do
#     it "triggers #list_songs" do
#       allow(music_library_controller).to receive(:gets).and_return("list songs", "exit")

#       expect(music_library_controller).to receive(:list_songs)

#       capture_puts { music_library_controller.call }
#     end
#   end

#   describe "'list artists'" do
#     it "triggers #list_artists" do
#       allow(music_library_controller).to receive(:gets).and_return("list artists", "exit")

#       expect(music_library_controller).to receive(:list_artists)

#       capture_puts { music_library_controller.call }
#     end
#   end

#   describe "'list genres'" do
#     it "triggers #list_genres" do
#       allow(music_library_controller).to receive(:gets).and_return("list genres", "exit")

#       expect(music_library_controller).to receive(:list_genres)

#       capture_puts { music_library_controller.call }
#     end
#   end

#   describe "'list artist'" do
#     it "triggers #list_songs_by_artist" do
#       allow(music_library_controller).to receive(:gets).and_return("list artist", "exit")

#       expect(music_library_controller).to receive(:list_songs_by_artist)

#       capture_puts { music_library_controller.call }
#     end
#   end

#   describe "'list genre'" do
#     it "triggers #list_songs_by_genre" do
#       allow(music_library_controller).to receive(:gets).and_return("list genre", "exit")

#       expect(music_library_controller).to receive(:list_songs_by_genre)

#       capture_puts { music_library_controller.call }
#     end
#   end

#   describe "'play song'" do
#     it "triggers #play_song" do
#       allow(music_library_controller).to receive(:gets).and_return("play song", "2", "exit")

#       expect(music_library_controller).to receive(:play_song)

#       capture_puts { music_library_controller.call }
#     end
#   end
# end
