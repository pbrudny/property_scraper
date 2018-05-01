class AddImagesToAd < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    add_column :ads, :images, :text, array:true, default: []
  end
end
