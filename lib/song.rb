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
  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create(song_name)
  end
  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    artist_name = filename_array[0]
    song_name = filename_array[1]
    genre_name = filename_array[2][0..-4]
    new_song = create(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.genre = Genre.find_or_create_by_name(genre_name)
    new_song
  end
end
#binding.pry
