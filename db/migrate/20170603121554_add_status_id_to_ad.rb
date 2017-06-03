class AddStatusIdToAd < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :status_id, :integer, null: false
  end
end
