class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.references :template_cate, index: true
      t.string :property
      t.string :base_url
      t.string :title
      t.text :description
      t.string :demo_img

      t.timestamps
    end
    
  end
end
