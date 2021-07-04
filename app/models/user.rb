class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie

  validates :name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP,
            uniqueness: true
  validates :password, length: { minimum: 10, allow_blank: true }
  validates :username, presence: true,
            format: { with: /\A[A-Z0-9]+\z/i },
            uniqueness: { case_sensitive: false }


  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

end
