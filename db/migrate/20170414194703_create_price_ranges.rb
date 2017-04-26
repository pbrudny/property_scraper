class CreatePriceRanges < ActiveRecord::Migration[5.0]
  def change
    create_table :price_ranges do |t|
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end
