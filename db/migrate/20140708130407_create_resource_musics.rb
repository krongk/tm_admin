class CreateResourceMusics < ActiveRecord::Migration
  def change
    create_table :resource_musics do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
