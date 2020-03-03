class MusicLibraryController

  def initialize(path = './db/mp3s')
    @new_object = MusicImporter.new(path)
    @new_object.import
  end 

  def call 
    user_input = ""
    while user_input != "exit" do 
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp

      case user_input 
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
      end 
    end 
  end 

  def list_songs
    Song.all.sort {|song1,song2| song1.name<=>song2.name}.each_with_index do |x, y| 
        puts "#{y+1}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
      end 
  end 

  def list_artists
    Artist.all.sort{|artist1, artist2| artist1.name <=> artist2.name}.each_with_index do |x, y|
      puts "#{y+1}. #{x.name}"
    end 
  end 

  def list_genres 
    Genre.all.sort{|genre1, genre2| genre1.name <=> genre2.name}.each_with_index do |x, y|
      puts "#{y+1}. #{x.name}"
    end 
  end 

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp 
    if artist = Artist.find_by_name(input)
      artist.songs.sort{|artist1,artist2| artist1.name<=>artist2.name}.each_with_index do |x, y|
        puts "#{y+1}. #{x.name} - #{x.genre.name}"
      end 
    end 
  end 

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    if genre = Genre.find_by_name(input)
      genre.songs.sort{|genre1,genre2| genre1.name<=>genre2.name}.each_with_index do |x, y|
        puts "#{y+1}. #{x.artist.name} - #{x.name}"
      end 
    end 
  end 

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.to_i
    if user_input < Song.all.length && user_input != 0
      arr = Song.all.sort{|song1,song2| song1.name <=> song2.name}
      song = arr[user_input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end 
  end 
end 