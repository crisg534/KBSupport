ActiveAdmin.register Post do
  index :download_links => false do
    column :id
    column :title
    column "User" do |comment|
      if comment.user
        comment.user.email
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
    div do
      panel("Post Comments") do
        post.comments.each do |comment|
          panel(comment.user.email) do
            comment.comment.html_safe
          end
        end
      end
    end
  end
end
