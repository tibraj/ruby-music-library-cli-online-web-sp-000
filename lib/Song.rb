class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []
  def initialize(name, artist="artist")
    @name = name
    self.artist=(artist) if artist != nil
  end

  def artist 
    @artist 
  end 
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
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

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
end
