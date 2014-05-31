class CreateTemplateKeystores < ActiveRecord::Migration
  def change
    create_table :template_keystores do |t|
      t.references :template, index: true
      t.string :key
      t.text :value

      t.timestamps
    end
     add_index :template_keystores, [:template_id, :key], unique: true
  end
end
