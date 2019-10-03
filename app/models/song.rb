class Song < ActiveRecord::Base 
    validates :title, presence: true, uniqueness: true 
    validates :released, inclusion: { in: [true, false]}
    validates :artist_name, presence: true
    validates :release_year, presence: true, if: :released?
    validate :release_year_cannot_be_future
    

    def released?
        self.released
    end

    def release_year_cannot_be_future
        if release_year.present? && release_year > Date.current.year
            errors.add(:release_year, "can't be in the future")
        end
    end

    
end 