module MoviesHelper

  def shorten_description movie
    truncate(movie.description, length: 40, separator: ' ')
  end

  def total_gross movie
    movie.flop? ? 'Flop' : number_to_currency(movie.total_gross, precision: 0)
  end

  def year_of movie
    # movie.released_on.strftime("%Y")
    movie.released_on.year
  end

  def average_stars movie
    average_stars = movie.average_stars
    if average_stars.zero?
      'No reviews'
    else
      pluralize(number_with_precision(movie.average_stars, precision: 1), 'star')
    end
  end
end
