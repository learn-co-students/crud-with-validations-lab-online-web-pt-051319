class SongsController < ApplicationController
  def index
    @songs = Song.all
  end  

  def show
    @song = Song.find(params[:id])
  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def song_params
    params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
  end
  
end
