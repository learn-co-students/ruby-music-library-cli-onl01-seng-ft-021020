class MusicImporter
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path

  end
  
  def files
    @files = []
    
    Dir.foreach(path) do |filename|
      next if filename == '.' || filename == '..'

      @files << "#{filename}"
      
      values = "#{filename}".split(" - ")
      

    end
    
    return @files
  end
  
  def import
    my_files = files
    
    my_files.each do |file|
      Song.create_from_filename(file)
    end
  end
  
end

