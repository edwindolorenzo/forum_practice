class RemoveBodyAndTextFromChats < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :body, :string
    remove_column :chats, :text, :string
  end
end
