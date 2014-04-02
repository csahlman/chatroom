class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :description
      t.integer :messages_count

      t.timestamps
    end
  end
end
