class AddStripeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_id, :string
    add_column :users, :stripe_plan_id, :string
    add_column :users, :subscription_type, :string
  end
end
