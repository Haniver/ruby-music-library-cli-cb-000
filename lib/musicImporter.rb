class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    puts "These are the files: " + Dir[@path + "/*"].inspect
  end
end
