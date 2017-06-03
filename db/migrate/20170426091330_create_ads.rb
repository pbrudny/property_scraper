class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :url
      t.string :phone
      t.integer :price
      t.belongs_to :district, foreign_key: true
      t.string :offer_id
      t.string :tipologia
      t.text :description
      t.string :image_path
      t.string :location
      t.datetime :publicated_at

      t.timestamps
    end
  end
end
