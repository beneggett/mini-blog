class Author < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :comments, through: :posts
  attr_accessible :bio, :email, :first_name, :last_name, :twitter, :username, :password, :password_confirmation
  # presence
  validates :first_name, :last_name, presence: true
  # uniqueness
  validates :twitter, uniqueness: true, allow_blank: true
  # length
  validates :bio, length: { in: 30..500 }, allow_blank: true
  # format
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true,
                    uniqueness: true,
                    length: { minimum: 3 },
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}

  def full_name
    (first_name + ' ' + last_name).titleize
  end

  def twitter_link
    "http://www.twitter.com/#{twitter}"
  end

end
