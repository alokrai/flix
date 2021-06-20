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
end
