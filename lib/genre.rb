class Genre
    attr_accessor :name
    attr_reader :songs

    @@all = []
    
    extend Concerns::Memorable
    extend Concerns::Findable

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song_object)
        song_object.genre ||= self
        @songs << song_object unless @songs.include?(song_object)
    end

    def artists
        Song.all.select{|s| s.genre == self}.collect{|s| s.artist}.uniq
    end
end