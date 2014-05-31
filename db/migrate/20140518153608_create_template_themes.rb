class CreateTemplateThemes < ActiveRecord::Migration
  def change
    create_table :template_themes do |t|
      t.references :template, index: true
      t.string :title
      t.string :css_url
      t.string :preview_images
      t.string :preview_url

    end
  end
end
