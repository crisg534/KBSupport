class Post < ActiveRecord::Base
  attr_accessible :user_id, :title, :comment
  acts_as_commentable
  belongs_to :user
  validates_presence_of :title, :comment

  def user_post_equal(current_user)
    if current_user.id == self.user.id
      true
    else
      false
    end
  end
end
