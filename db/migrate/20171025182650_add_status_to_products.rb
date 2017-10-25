class AddStatusToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :status, :string, :default => 'Não Reservado'
  end
end
