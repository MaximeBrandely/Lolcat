class AddTotalToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :total, :decimal
    add_column :orders, :status, :string
  end
end
