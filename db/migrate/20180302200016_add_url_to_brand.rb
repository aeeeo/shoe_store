class AddUrlToBrand < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :img_url, :string
  end
end
