class AddReserveToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :reserve_id, :integer
    add_column :products, :status, :string, :default => 'Disponível'
  end
end
