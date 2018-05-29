class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    puts "These are the files: " + Dir[@path + "/*"][20..28].inspect
  end
end
