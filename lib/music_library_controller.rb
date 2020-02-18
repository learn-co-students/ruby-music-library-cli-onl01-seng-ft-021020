class MusicLibraryController
  

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
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
    
    flag = true
    while flag
      puts "What would you like to do?"
      input = gets.strip
      
      case input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      when "exit"
        flag = false
      end
    end
  end

  def list_songs
    songs = Song.all.map{ |song| [song.artist.name, song.name, song.genre.name] }.sort{ |a, b| a[1] <=> b[1] }
    songs.each_with_index{ |song, i| puts "#{i+1}. #{song[0]} - #{song[1]} - #{song[2]}" }
  end

  def list_artists
    artists = Artist.all.sort{ |a, b| a.name <=> b.name }.map.with_index do |artist,i| 
      puts "#{i+1}. #{artist.name}"
      artist
    end
    artists
  end

  def list_genres
    genres = Genre.all.sort{ |a, b| a.name <=> b.name }.map.with_index do |genre,i| 
      puts "#{i+1}. #{genre.name}"
      genre
    end
    genres
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_by_name(gets.chomp)
    if artist != nil
      songs = artist.songs.sort{ |a, b| a.name <=> b.name }.map.with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
        song
      end
      songs
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets.chomp)
    if genre != nil
      songs = genre.songs.sort{ |a, b| a.name <=> b.name }.map.with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
        song
      end
      songs
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_arr = Song.all.map{ |song| [song.artist.name, song.name, song.genre.name] }.sort{ |a, b| a[1] <=> b[1] }
    choice = gets.chomp.to_i - 1
    if choice > 0 && choice < song_arr.length
      puts "Playing #{song_arr[choice][1]} by #{song_arr[choice][0]}" 
    end
  end


end