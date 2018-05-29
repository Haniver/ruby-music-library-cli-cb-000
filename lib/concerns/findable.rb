module Concerns::Findable
  def find_by_name(name)
    all.find{ |element| element.name == song_name}
  end
end
