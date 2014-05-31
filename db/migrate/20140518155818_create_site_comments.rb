class CreateSiteComments < ActiveRecord::Migration
  def change
    create_table :site_comments do |t|
      #t.references :user, index: true
      t.references :site, index: true
      t.references :template_page, index: true
      t.string :name
      t.string :mobile_phone
      t.string :tel_phone
      t.string :email
      t.string :qq
      t.string :weixin
      t.string :address
      t.string :gender
      t.date :birth
      t.string :hobby
      t.text :content
      t.text :content2
      t.text :content3
      t.string :status
      t.integer :updated_by
      t.text :note
      t.timestamps
    end
  end
end
