class CreateSitePageKeystores < ActiveRecord::Migration
  def change
    create_table :site_page_keystores do |t|
      t.references :site_page, index: true
      t.string :key
      t.text :value

      t.timestamps
    end
    add_index :site_page_keystores, [:site_page_id, :key], unique: true
  end
end
