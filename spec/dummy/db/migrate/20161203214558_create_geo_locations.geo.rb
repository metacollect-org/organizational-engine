# This migration comes from geo (originally 20161112212726)
class CreateGeoLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :geo_locations do |t|
      t.string :address
      t.string :zip_code, limit: 20
      t.integer :place_id
      t.integer :country_id
      t.float :latitude
      t.float :longitude
      t.references :locatable, polymorphic: true, index: true
    end
    add_foreign_key :geo_locations, :geo_places, column: :place_id
    add_foreign_key :geo_locations, :geo_countries, column: :country_id
  end
end
