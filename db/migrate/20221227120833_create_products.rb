class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :url
      t.string :manufacturer
      t.string :prod_desc
      t.string :prod_feature
      t.float :price

      t.timestamps
    end
  end
end
