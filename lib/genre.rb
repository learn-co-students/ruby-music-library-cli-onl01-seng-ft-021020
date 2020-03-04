class Genre
    attr_accessor :name
    attr_reader :songs

    @@all = []

    extend Concerns::Findable

    def initialize(name)
        @name = name
        @songs = []
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
        Genre.new(name).tap{|g| g.save}
    end

    def add_song(song_object)
        song_object.genre ||= self
        @songs << song_object unless @songs.include?(song_object)
    end

    def artists
        @songs.collect{|s| s.artist}.uniq
    end
end