class AddSearchLinkToAd < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :search_link_id, :integer, null: false
  end
end
