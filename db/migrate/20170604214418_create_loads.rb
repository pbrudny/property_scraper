class CreateLoads < ActiveRecord::Migration[5.0]
  def change
    create_table :loads do |t|
      t.text :errors_list, array: true, default: []

      t.timestamps
    end
  end
end
