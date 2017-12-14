class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :merk
      t.string :handelsbenaming
      t.string :voertuigsoort
      t.string :eerste_kleur
      t.integer :aantal_zitplaatsen
      t.integer :catalogusprijs
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
