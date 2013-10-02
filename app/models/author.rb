class Author < ActiveRecord::Base
  has_many :posts
  attr_accessible :bio, :email, :first_name, :last_name, :twitter, :username

end
