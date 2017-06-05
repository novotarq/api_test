class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :url
      t.integer :page_id

      t.timestamps
    end

    add_index :links, :page_id
  end
end
