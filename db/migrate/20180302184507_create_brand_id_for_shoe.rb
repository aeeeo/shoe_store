class CreateBrandIdForShoe < ActiveRecord::Migration[5.1]
  def change
    add_column :shoes, :brand_id, :integer
  end
end
