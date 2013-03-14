ActiveAdmin.register Comment, :as => "PostComment" do
  index :download_links => false do
    column :id
    column "User" do |comment|
      if comment.user
        comment.user.email
      end
    end
    column "Post" do |comment|
      if comment.user.post.any?
        comment.user.post.first.title
      end
    end
    column :created_at
    default_actions
  end

  show do |object|
    attributes_table do
      row :id
      row :user
      row :comment do
        object.comment.html_safe
      end
      row :created_at
    end
  end
end
