class AddDeletedAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at

    add_column :comments, :deleted_at, :datetime
    add_index :comments, :deleted_at

    add_column :discussions, :deleted_at, :datetime
    add_index :discussions, :deleted_at
  end
end
