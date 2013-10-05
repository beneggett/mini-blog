class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_many :notes, :class_name => "Comment", 
  :inverse_of => :post, :foreign_key => :post_id, :primary_key => :id
  attr_accessible :body, :published_at, :title, :author_id
  validates :body, presence: true, length: {minimum: 20}
  validates :title, presence: true, length: {in: 5...100}
  validates :author, presence: {message: "must be a real author."}
end
