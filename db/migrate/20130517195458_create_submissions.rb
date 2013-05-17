class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.float :price
      t.string :timeframe
      t.text :description
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
