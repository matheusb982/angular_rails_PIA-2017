class QuantityStringForProducts < ActiveRecord::Migration[5.0]
  def self.up
    change_table :products do |t|
      t.change :quantity, :string
    end
  end
  def self.down
    change_table :products do |t|
      t.change :quantity, :integer
    end
  end
end
