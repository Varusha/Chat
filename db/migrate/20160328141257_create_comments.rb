class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content

      t.references :user
      t.references :product
      t.references :parent
    end
  end
end
