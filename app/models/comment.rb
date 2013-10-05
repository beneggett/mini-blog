class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :commenter_name, :message, :post_id
  validates :message, :commenter_name, presence: true
  validates :post, presence: {message: "must be a valid post"}
  
end
