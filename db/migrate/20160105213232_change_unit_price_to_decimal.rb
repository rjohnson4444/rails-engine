class ChangeUnitPriceToDecimal < ActiveRecord::Migration
  def change
    remove_column :items, :unit_price, :string
    add_column :items, :unit_price, :decimal
    change_column :invoice_items, :unit_price, :decimal
  end
end
