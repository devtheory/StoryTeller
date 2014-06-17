class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true
      t.string :subscription_type
      t.string :stripe_id
      t.string :stripe_subscription_id

      t.timestamps
    end
  end
end
