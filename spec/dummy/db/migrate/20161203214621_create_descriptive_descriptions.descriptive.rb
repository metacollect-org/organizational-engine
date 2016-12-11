# This migration comes from descriptive (originally 20161203211354)
class CreateDescriptiveDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :descriptive_descriptions do |t|
      t.string :definition, limit: 80, null: false
      t.text :full, limit: 1000, null: false
      t.references :describable, null: false, polymorphic: true, index: { name: 'index_descriptive_descriptions_describable' }
      t.integer :language_id, null: false
    end
    add_foreign_key :descriptive_descriptions, :multilingual_languages, column: :language_id
  end
end
