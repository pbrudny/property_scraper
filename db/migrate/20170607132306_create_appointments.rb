class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.text :address
      t.text :note
      t.belongs_to :ad, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
