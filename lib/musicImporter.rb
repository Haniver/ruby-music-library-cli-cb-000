class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    normalized = Dir[@path + "/*"].collect{ |filename| filename[20..-1]}
    puts normalized.inspect
  end
end
