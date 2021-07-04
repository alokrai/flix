module FavoritesHelper
  def fave_or_unfave_button(movie, favorite)
    if favorite
      button_to '♡ Unfave', movie_favorite_path(@movie), method: :delete, disabled: !current_user
    else
      button_to '♥️ Fave', movie_favorites_path(@movie), disabled: !current_user
    end
  end
end
