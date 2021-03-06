class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :message_count
      t.string :email

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :name, unique: true
  end
end
