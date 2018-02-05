class SongsController < ApplicationController
   require 'csv'
  
    def index
      @songs = Song.all
    end
  
   def upload
     CSV.foreach(params[:file].path, headers: true) do |song|
       new_song = Song.find_or_create_by(title: song[0])
       new_artist = Artist.find_or_create_by(name: song[1])
       new_song.artist = new_artist
       new_song.save
     end
     redirect_to songs_path
   end
 
    def show
      @song = Song.find(params[:id])
    end
 @@ -51,4 +62,3 @@ def song_params
      params.require(:song).permit(:title, :artist_name)
    end
  end