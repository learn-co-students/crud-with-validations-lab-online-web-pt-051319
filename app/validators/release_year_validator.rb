class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        songs = Song.where({artist_name: record.artist_name, title: record.title, release_year: record.release_year})
        unless songs.empty? 
            record.errors[:release_year] << "An artist cannot release the same song twice in a year"
        end
    end
end