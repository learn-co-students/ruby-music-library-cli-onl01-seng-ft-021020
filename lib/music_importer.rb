require_relative "../config/environment.rb"

class MusicImporter
  
  def initialize(path)
  @path = path   
  end
  
  def path
    @path
  end
  
  def files
    @mp3_file_names = Dir.entries(@path).select {|f| !File.directory? f}
    @mp3_file_names
  end
  
  def import
    files.each do |x|
      Song.create_from_filename(x)
    end
  end
    
end

