class AddAuthorIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :author_id, :integer
    add_index :links, :author_id
  end
end
