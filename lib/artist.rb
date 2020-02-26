class Artist
    attr_accessor :name
    attr_reader :songs

    @@all = []
    
    extend Concerns::Memorable
    extend Concerns::Findable

    def initialize(name)
        @name = name
        save
        @songs = []
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song_object)
        song_object.artist ||= self
        @songs << song_object unless @songs.include?(song_object)
    end

    def genres
        Song.all.select{|s| s.artist == self}.collect{|s| s.genre}.uniq
    end
end