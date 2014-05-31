class CreateCommonKeys < ActiveRecord::Migration
  def change
    create_table :common_keys do |t|
      t.string :name
      t.string :type
      t.string :title
      t.string :placeholder
      t.string :hint
      t.string :default_value

      t.timestamps
    end
  end
end
