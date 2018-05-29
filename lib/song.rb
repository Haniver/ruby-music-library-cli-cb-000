require 'pry'
require_relative 'artist.rb'
class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    self.class.all << self
  end
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist == nil
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre == nil || genre.songs.include?(self)
  end
  def self.find_by_name(song_name)
    all.find{ |song| song.name == song_name}
  end
end
#binding.pry
