class Song
    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    extend Concerns::Findable

    def initialize(name, artist = nil, genre = nil)
        @name = name
        artist.add_song(self) if artist
        genre.add_song(self) if genre
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        self.new(name).tap{|s| s.save}
    end

    def artist=(artist_object)
        @artist = artist_object
        artist_object.add_song(self)
    end

    def genre=(genre_object)
        @genre = genre_object
        genre_object.add_song(self)
    end

    def self.new_from_filename(filename)
        array = filename.split(" - ")
        song_name = array[1]
        artist_name = array[0]
        genre_name = array[2].gsub(".mp3", "")

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        self.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).tap {|s| s.save}
    end
end