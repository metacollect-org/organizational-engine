# This migration comes from ontological (originally 20161115221044)
class CreateOntologicalCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :ontological_categories do |t|
      t.string :uri, null: false, unique: true, index: true
    end
  end
end
