class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  has_many :notes, :class_name => "Comment", 
  :inverse_of => :post, :foreign_key => :post_id, :primary_key => :id
  attr_accessible :body, :published_at, :title, :author_id
end
