class AddLicensePlateToVehicle < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :license_plate, :string
    add_index :vehicles, :license_plate, unique: true
  end
end
