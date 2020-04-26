class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song)
    song = Song.new(song)
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end

  def self.new_from_filename(filename)
    song = self.new(filename)
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    @@all << song
  end
end
