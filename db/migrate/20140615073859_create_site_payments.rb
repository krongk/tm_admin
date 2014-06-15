class CreateSitePayments < ActiveRecord::Migration
  def change
    create_table :site_payments do |t|
      t.references :site, index: true
      t.string :status
      t.string :pay_type
      t.decimal :price, :precision => 8, :scale => 2
      t.datetime :pay_at
      t.integer :updated_by
      t.string :note
      t.string :is_processed, default: 'n'

      t.timestamps
    end
  end
end
