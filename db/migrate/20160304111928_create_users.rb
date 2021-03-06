class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.integer :messages_count, default: 0
      t.integer :pings_count, default: 0
      t.integer :purchases_count, default: 0
      t.integer :orders_count, default: 0
      t.integer :followers_count, default: 0
      t.integer :followees_count, default: 0
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
