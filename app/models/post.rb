class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments  
  attr_accessible :body, :published_at, :title, :author_id
end
