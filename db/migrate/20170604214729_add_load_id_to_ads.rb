class AddLoadIdToAds < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :load_id, :integer, null: false
  end
end
