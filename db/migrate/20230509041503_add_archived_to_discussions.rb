class AddArchivedToDiscussions < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :archived_at, :datetime
  end
end
