class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.integer :submission_id
      t.string :title
      t.text :description
      t.date :end_date
      t.float :min_price
      t.float :max_price
      t.integer :vote
      t.boolean :flag
      t.boolean :active

      t.timestamps
    end
  end
end
