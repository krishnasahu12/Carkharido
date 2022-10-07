class AddImagesToCar < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :images, :string
  end
end
