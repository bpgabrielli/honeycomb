class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :property_1
      t.string :property_2
      t.string :url
      t.string :website
      t.references :user, index: true

      t.timestamps
    end
  end
end
