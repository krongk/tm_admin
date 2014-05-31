class CreateTemplatePages < ActiveRecord::Migration
  def change
    create_table :template_pages do |t|
      t.references :template, index: true
      t.integer :sort_id
      t.string :title
      t.string :temp_url
      t.string :temp_form_url
      t.string :demo_img

      t.timestamps
    end

    add_index(:template_pages, [:template_id, :title], :unique => true)
  end
end
