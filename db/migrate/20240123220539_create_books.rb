class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.float :price
      t.references :publisher, foreign_key: true
      t.boolean :availability

      t.timestamps
    end
  end
end
