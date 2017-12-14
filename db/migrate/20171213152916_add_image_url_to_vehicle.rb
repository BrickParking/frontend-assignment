class AddImageUrlToVehicle < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :image_url, :string
  end
end
