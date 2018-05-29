class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    puts "These are the files: " + Dir[@path + "/*"][2..28].inspect
  end
end
