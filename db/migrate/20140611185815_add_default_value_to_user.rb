class AddDefaultValueToUser < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, default: "reader"
  end
end
