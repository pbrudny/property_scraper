class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.belongs_to :search_link, foreign_key: true
      t.string :email
      t.string :frequency

      t.timestamps
    end
  end
end
