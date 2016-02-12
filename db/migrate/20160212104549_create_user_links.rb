class CreateUserLinks < ActiveRecord::Migration
  def change
    create_table :user_links do |t|
      t.integer :user_id, null: false
      t.integer :link_id, null: false

      t.timestamps null: false
    end
    add_index :user_links, :user_id
    add_index :user_links, :link_id
  end
end
