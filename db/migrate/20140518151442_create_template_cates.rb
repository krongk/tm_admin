class CreateTemplateCates < ActiveRecord::Migration
  def change
    create_table :template_cates do |t|
      t.string :title, index: true
      t.string :description

    end

    add_index(:template_cates, :title, :unique => true)

  end
end
