class CreateBizSites < ActiveRecord::Migration
  def change
    create_table :biz_sites do |t|
      t.string :title
      t.string :thumb
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
