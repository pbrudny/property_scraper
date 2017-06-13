class ChangeStatusToString < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :status, :string
    remove_column :ads, :status_id, :integer
  end
end
