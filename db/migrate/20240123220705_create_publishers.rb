class CreatePublishers < ActiveRecord::Migration[6.1]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :catalog_home
      t.string :catalog_search

      t.timestamps
    end
  end
end
