class Comment < ActiveRecord::Base
  belongs_to :post, :counter_cache => true
  attr_accessible :body, :commenter
end
