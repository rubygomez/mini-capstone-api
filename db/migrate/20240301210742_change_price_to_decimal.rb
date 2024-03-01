class ChangePriceToDecimal < ActiveRecord::Migration[7.1]
  def change
    change_column :Products, :price, :decimal, precision: 9, scale: 2
  end
end
