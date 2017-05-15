class CreateSearchLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :search_links do |t|
      t.string :name
      t.string :url
      t.belongs_to :site, foreign_key: true

      t.timestamps
    end
  end
end
