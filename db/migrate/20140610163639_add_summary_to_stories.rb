class AddSummaryToStories < ActiveRecord::Migration
  def change
    add_column :stories, :summary, :string
  end
end
