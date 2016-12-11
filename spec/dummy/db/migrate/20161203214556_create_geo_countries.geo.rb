# This migration comes from geo (originally 20161112184606)
class CreateGeoCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :geo_countries do |t|
      t.string :code, limit: 2  # ISO 3166-1 alpha-2
      t.string :zip_format
    end
    add_index :geo_countries, :code, unique: true
  end
end
