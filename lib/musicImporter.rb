class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    normalized = Dir[@path + "/*"].collect{ |filename| filename[21..-1]}
    puts normalized.inspect
  end
end
