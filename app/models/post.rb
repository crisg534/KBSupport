class Post < ActiveRecord::Base
  attr_accessible :user_id, :title, :comment
  acts_as_commentable
  belongs_to :user
end
