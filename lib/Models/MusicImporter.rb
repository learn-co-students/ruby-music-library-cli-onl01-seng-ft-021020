
require "pry"

class MusicImporter
  attr_reader :path, :filenames
  
  def initialize(path)
    @path = path 
  end 
  
  def files
  Dir.entries(path).select {|entry| entry.include?(".mp3")}
  end
  
  def import 
    files.each do |mp3| Song.create_from_filename(mp3)
   # binding.pry
  end 
end
  
  
  
end
#self.new_from_filename(son).genre.name


 #1) MusicImporter #import imports the files into the library by invoking Song.create_from_filename
  #   Failure/Error: expect(Song).to receive(:create_from_filename).with("ActionBronson - Larry Csonka - indie.mp3")