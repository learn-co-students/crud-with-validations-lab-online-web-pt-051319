class Song < ApplicationRecord
	validates :title, presence: true
	validates :title, uniqueness: { scope: :release_year }
	validates :released, inclusion: { in: [true, false] }
	validates :release_year, presence: true, if: Proc.new { |song| song.released }
	validates :release_year, numericality:
		{ 
			only_integer: true,
			less_than_or_equal_to: Time.current.year
		}, if: Proc.new { |song| song.released }
	validates :artist_name, presence: true
	validates :genre, presence: true
end
