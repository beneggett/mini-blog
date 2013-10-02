class Post < ActiveRecord::Base
  belongs_to :author  
  attr_accessible :body, :published_at, :title, :author_id
end
