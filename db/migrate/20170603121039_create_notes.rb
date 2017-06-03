class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.belongs_to :ad, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
