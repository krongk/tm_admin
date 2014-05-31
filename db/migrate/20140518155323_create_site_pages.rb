class CreateSitePages < ActiveRecord::Migration
  def change
    create_table :site_pages do |t|
      #t.references :user, index: true
      t.references :site, index: true
      t.references :template_page, index: true
      t.string :short_title
      t.string :title
      t.text :form_content

      t.timestamps
    end
    add_index :site_pages, [:site_id, :short_title], unique: true
  end
end
