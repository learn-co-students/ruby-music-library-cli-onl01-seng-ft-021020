class MusicImporter
  
  attr_accessor :files

  def initialize(path)
    @path = path
  end 

  def path 
    @path
  end 

  def files 
    Dir.entries(@path).select!{|song| song.end_with?(".mp3")}
  end 

  def import 
    files.each do |song|
      Song.create_from_filename(song)
    end 
  end 
end  