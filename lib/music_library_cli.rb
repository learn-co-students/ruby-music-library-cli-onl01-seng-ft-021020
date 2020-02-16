require_relative 'music_importer'
require_relative 'song'
require_relative 'artist'
require_relative 'genre'

class MusicLibraryController



  def initialize(path = "./db/mp3s")
    @path = path
    
    new_music_importer = MusicImporter.new(path)
    new_music_importer.import
  end
  
  def call
    user_choice = ''
    
    while user_choice != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      
      user_choice = gets.strip
      
      case user_choice
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      when "exit"
        return
      end
    end
    
  end
  
  # def list_songs
  #   sorted_songs = Song.all.sort { |a, b| a.name <=> b.name }
    # sorted_songs.each_with_index do |song, idx|
    #   puts "#{idx + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    # end
  # end
  
  def list_songs
    sorted_songs = Song.all.sort_by do |song|
      song.name
    end
    sorted_songs.each_with_index do |song, idx|
      puts "#{idx + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    sorted_artists = Artist.all.sort { |a, b| a.name <=> b.name }
    sorted_artists.each_with_index do |artist, idx|
      puts "#{idx + 1}. #{artist.name}"
    end
  end
  
  def list_genres
    sorted_genres = Genre.all.sort { |a, b| a.name <=> b.name }
    sorted_genres.each_with_index do |genre, idx|
      puts "#{idx + 1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    usr_choice = gets.strip
    
    return usr_choice unless Song.all.detect { |song| song.artist.name == usr_choice }
    
    songs = Song.all.select { |song| song.artist.name == usr_choice }
    songs = songs.sort { |a, b| a.name <=> b.name }
    songs.each_with_index do |song, idx|
      puts "#{idx + 1}. #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    usr_choice = gets.strip
    
    return usr_choice unless Song.all.detect { |song| song.genre.name == usr_choice }
    
    songs = Song.all.select { |song| song.genre.name == usr_choice }
    songs = songs.sort { |a, b| a.name <=> b.name }
    
    songs.each_with_index do |song, idx|
      puts "#{idx + 1}. #{song.artist.name} - #{song.name}"
    end  
  end
  
  def play_song
    songs = Song.all.sort { |a, b| a.name <=> b.name }
    puts "Which song number would you like to play?"
    list_songs
    
    usr_choice = gets.strip
    
    if (1..Song.all.length).to_a.include?(usr_choice)
      song = list_of_songs[usr_choice + 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end      


  # describe "#play_song" do
  #   it "prompts the user to choose a song from the alphabetized list output by #list_songs" do
  #     allow(music_library_controller).to receive(:gets).and_return("Testing for #puts")

  #     expect($stdout).to receive(:puts).with("Which song number would you like to play?")

  #     allow($stdout).to receive(:puts)

  #     music_library_controller.play_song
  #   end

  #   it "accepts user input" do
  #     allow(music_library_controller).to receive(:gets).and_return("Testing for #gets")

  #     expect(music_library_controller).to receive(:gets)

  #     music_library_controller.play_song
  #   end

  #   it "upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs" do
  #     allow(music_library_controller).to receive(:gets).and_return("4")

  #     expect($stdout).to receive(:puts).with("Which song number would you like to play?")
  #     expect($stdout).to receive(:puts).with("Playing Larry Csonka by Action Bronson")

  #     music_library_controller.play_song
  #   end

  #   it "does not 'puts' anything out if a matching song is not found" do
  #     allow(music_library_controller).to receive(:gets).and_return("6")

  #     expect($stdout).to receive(:puts).with("Which song number would you like to play?")
  #     expect($stdout).to_not receive(:puts)

  #     music_library_controller.play_song
  #   end

  #   it "checks that the user entered a number between 1 and the total number of songs in the library" do
  #     allow(music_library_controller).to receive(:gets).and_return("0")

  #     expect($stdout).to receive(:puts).with("Which song number would you like to play?")
  #     expect($stdout).to_not receive(:puts)

  #     music_library_controller.play_song
      
      
      