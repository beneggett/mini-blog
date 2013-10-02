class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.text :bio
      t.string :email
      t.string :twitter

      t.timestamps
    end
  end
end
