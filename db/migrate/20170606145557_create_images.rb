class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :url
      t.belongs_to :ad, foreign_key: true

      t.timestamps
    end
  end
end
