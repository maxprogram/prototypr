class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.integer :reputation
      t.boolean :flag
      t.boolean :active
      t.text :profile
      t.text :bio
      t.string :web

      t.timestamps
    end
  end
end
