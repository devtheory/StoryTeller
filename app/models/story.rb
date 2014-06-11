class Story < ActiveRecord::Base
  belongs_to :user

  validates :title, length: {minimum: 3}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :summary, length: {minimum: 5}, presence: true

  default_scope { order('created_at DESC')}
  
end
