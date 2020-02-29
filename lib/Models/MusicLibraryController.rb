require "pry"

class MusicLibraryController
  attr_accessor :path
  def initialize(path= './db/mp3s')
   
MusicImporter.new(path).import
  end
  
  
  def call 
        puts "Welcome to your music library!"

    path = ""
    until path == "exit"
      case path
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
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      path = gets.strip
end
end

 
    def list_songs
      #binding.pry
      list = Song.all.sort {|a,b| a.name <=> b.name }
         i = 1
    list.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    end
end

  def list_artists
    list_by_name(sort_by_name(Artist.all))
  end

  def list_genres
    list_by_name(sort_by_name(Genre.all))
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    match = Artist.all.detect {|artist| artist.name == input}
    if match
      sort_by_name(match.songs).each_with_index {|song, i| puts "#{i + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp

    match = Genre.all.detect {|genre| genre.name == input}
    if match
      sort_by_name(match.songs).each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i #convert string to int
    match = nil
   sort_by_name(Song.all).each_with_index do |song, i|
      if input == (i + 1)
        match = song
      end
    end
    puts "Playing #{match.name} by #{match.artist.name}" if match
  end

  private
  def sort_by_name(items)
    items.sort {|item1, item2| item1.name <=> item2.name}
  end

  def list_by_name(items)
    items.each_with_index {|item, i| puts "#{i + 1}. #{item.name}"}
  end


end