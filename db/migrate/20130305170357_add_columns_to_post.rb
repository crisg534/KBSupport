class AddColumnsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :comment, :text
  end
end
