class AddPriceToShoe < ActiveRecord::Migration[5.1]
  def change
    add_column :shoes, :price, :integer
  end
end
