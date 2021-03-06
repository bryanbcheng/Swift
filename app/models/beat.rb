class Beat < ActiveRecord::Base
  attr_accessor :artist, :song

  before_save :link_artist_song

  belongs_to :user

  private

    def link_artist_song
      @artist = Artist.find_or_create_by_name(artist)
      
      self.artist_id = @artist.id
      
      @song = Song.find_or_create_by_name(song)

      self.song_id = @song.id
    end
end
