class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.references :user, index: true
      t.references :template, index: true
      t.string :short_title
      t.string :title
      t.string :description
      t.string :domain
      t.string :status
      t.boolean :is_published, default: true
      t.boolean :is_comment_show, default: true
      t.integer :updated_by
      t.text :note
      t.timestamps
    end
    add_index :sites, :short_title, unique: true
  end
end
