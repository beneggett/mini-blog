class ChangeBodyFromStringToTextOnPosts < ActiveRecord::Migration
  def up
    # change_column :table_name, :column_name, :type
    change_column :posts, :body, :text, limit: nil
  end

  def down
    change_column :posts, :body, :string
  end
end
