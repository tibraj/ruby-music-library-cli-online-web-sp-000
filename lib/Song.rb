class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name, artist="nil")
    @name = name
    @artist = artist if artist != nil
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
end
