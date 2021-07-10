class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(request.params[:id])
    @movies = @genre.movies
  end
end
