class MoviesController < ApplicationController

  before_action :require_signin, except: %i[index show]
  before_action :require_admin, except: %i[index show]

  def index
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
    @fans = @movie.fans
  end

  def create
    @movie = Movie.new
    @movie.update(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'Movie successfully created'
    else
      render :new
    end
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
    if @movie.save
      redirect_to @movie, notice: 'Movie successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url, alert: "Movie successfully deleted!"
  end

  private

  def movie_params
    params.require(:movie).
      permit(:title, :rating, :total_gross, :description, :released_on, :director, :duration, :image_name)
  end
end
