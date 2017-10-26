class AddDateReserveToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :products, :string
    add_column :products, :date_reserve, :date
  end
end
