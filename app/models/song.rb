class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, if: :released?
  validates :artist_name, presence: true
  validate :artist_cannot_release_song_twice_in_same_year
  validate :release_year_cannot_be_in_the_future 


  def released?
    !!released
  end

  def artist_cannot_release_song_twice_in_same_year
    if Song.all.detect { |song| song.artist_name == self.artist_name && song.title == self.title && song.release_year == self.release_year }
      errors.add(:title, "artist can't release same song twice in one year")
    end
  end

  def release_year_cannot_be_in_the_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end


end