class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song=self.new()
    new_song.save
    return new_song
  end

  def self.create_by_name(song_name)
    new_song=self.new_by_name(song_name)
    new_song.save
    return new_song
  end

  def self.new_by_name(song_name)
    new_song=self.new()
    new_song.name=song_name
    return new_song
  end

  def self.find_by_name(song_name)
    return self.all.find{|song_object| song_object.name==song_name}
  end

  def self.find_or_create_by_name(song_name)
    if(self.find_by_name(song_name)==nil)
      return self.create_by_name(song_name)
    else
      return self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    sorted=self.all.sort_by{|song_object| song_object.name}#.map{|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song=self.new()
    first_split=filename.split(' - ')
    new_song.artist_name=(first_split[0])
    new_song.name=(first_split[1].split('.')[0])
    return new_song
  end

  def self.create_from_filename(filename)
    new_song=self.new_from_filename(filename)
    new_song.save
    return new_song
  end
  
  def self.destroy_all
    self.all.clear
  end


  def save
    self.class.all << self
  end



end
