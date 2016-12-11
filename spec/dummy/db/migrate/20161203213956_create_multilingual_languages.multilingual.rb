# This migration comes from multilingual (originally 20161031014303)
class CreateMultilingualLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :multilingual_languages do |t|
      t.string :code, limit: 2, unique: true, null: false, index: true  # ISO 639-1
    end
  end
end
