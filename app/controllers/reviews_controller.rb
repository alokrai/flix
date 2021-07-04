class ReviewsController < ApplicationController

  before_action :set_movie
  before_action :require_signin, except: %i[index show]

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to movie_reviews_path(@movie),
                  notice: 'Thanks for your review!'
    else
      render :new
    end
  end

  def destroy
    review = @movie.reviews.find(params[:id])
    if review.destroy
      redirect_to movie_reviews_path(@movie),
                  alert: 'your review has been deleted!'
    else
      render :new
    end
  end

  def edit
    @review = @movie.reviews.find(params[:id])
  end

  def update
    @review = @movie.reviews.find(params[:id])
    @review.update(review_params)
    if @review.save
      redirect_to movie_reviews_path(@movie),
                  notice: 'Your review has been updated!'
    else
      render :new
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:comment, :stars)
  end

end
