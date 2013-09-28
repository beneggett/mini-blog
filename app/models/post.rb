class Post < ActiveRecord::Base
  attr_accessible :author_name, :body, :published_at, :title
end
