class Author < ActiveRecord::Base
  has_many :posts
  has_many :comments, through: :posts
  attr_accessible :bio, :email, :first_name, :last_name, :twitter, :username

end
