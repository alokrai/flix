class MoviesController < ApplicationController

  def index
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new
    @movie.update(movie_params)
    redirect_to @movie
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to @movie
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url
  end

  private
  def movie_params
    params.require(:movie).
      permit(:title, :rating, :total_gross, :description, :released_on, :director, :duration, :image_name)
  end
end
