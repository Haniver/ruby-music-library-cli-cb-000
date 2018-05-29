module Concerns::Findable
  def find_by_name(name)
    all.find{ |element| element.name == name}
  end
end
