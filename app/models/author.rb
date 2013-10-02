class Author < ActiveRecord::Base
  attr_accessible :bio, :email, :first_name, :last_name, :twitter, :username
end
