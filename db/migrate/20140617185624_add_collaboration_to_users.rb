class AddCollaborationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :collaborating_on, :string
  end
end
