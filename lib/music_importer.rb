require_relative 'song'

class MusicImporter
  attr_accessor :path

  def initialize(file_path)
    @path = file_path  
  end
  
  def path
    @path
  end
  
  def files
    all_files = Dir[@path+"/*.mp3"].map { |file| file.split("/").last }
    all_files
  end
  
  def import
    files_to_import = files
    files_to_import.each do |file|
      Song.create_from_filename(file)
    end
  end
  
end