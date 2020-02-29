class MusicImporter
  
  attr_reader :path, :filenames
  
  def initialize(path)
      @path = path 
  end
  
  def files
       @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end
  
  def import
      files.each{ |fil| Song.create_from_filename(fil)}
  end
  
end

















