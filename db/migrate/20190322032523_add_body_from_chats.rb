class AddBodyFromChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :body, :text
  end
end
