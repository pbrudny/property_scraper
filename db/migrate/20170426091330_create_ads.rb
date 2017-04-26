class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :url
      t.string :phone
      t.integer :price
      t.string :status
      t.belongs_to :district, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
