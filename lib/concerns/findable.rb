module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect { |obj| obj.name == name }
    end
    
    def find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else
        self.create(name)
      end
    end
    
    def new_from_filename(file)
      artist_name = file.split(" - ")[0]
      song_name = file.split(" - ")[1]
      genre = file.split(" - ")[2].chomp!('.mp3')
      
      new_artist = Artist.find_or_create_by_name(artist_name)
      new_genre = Genre.find_or_create_by_name(genre)
      
      song = self.new(song_name, new_artist, new_genre)
      song
    end
    
    def create_from_filename(file)
      new_song = new_from_filename(file)
      self.all << new_song
    end
    
  end
end