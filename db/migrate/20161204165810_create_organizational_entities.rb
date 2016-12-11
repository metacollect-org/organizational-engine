class CreateOrganizationalEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :organizational_entities do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :logo
    end
  end
end
