class CreateHtmlTags < ActiveRecord::Migration[5.1]
  def change
    create_table :html_tags do |t|
      t.string :content
      t.string :type
      t.integer :page_id

      t.timestamps
    end

    add_index :html_tags, :page_id
  end
end
