class MusicLibraryController
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end
  def call
    input =""
    while input != "exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp
    end
  end
  def list_songs
    songs = Song.all.collect { |song| song.name }.sort
    counter = 1
    songs.each do |song_name|
      song = Song.find_by_name(song_name)
      puts counter.to_s + ". " + song.artist + " - " + song_name + " - " + song.genre
      counter += 1
    end
  end
end
