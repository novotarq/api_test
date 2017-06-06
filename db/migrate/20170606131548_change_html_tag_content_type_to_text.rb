class ChangeHtmlTagContentTypeToText < ActiveRecord::Migration[5.1]
  def change
    change_column :html_tags, :content, :text
  end
end
