class ChageMessageCount < ActiveRecord::Migration
  def change
    remove_column :users, :message_count
    add_column :users, :messages_count, :integer, :default => 0
  end
end
