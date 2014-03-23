class CreateReveals < ActiveRecord::Migration
  def change
    create_table :reveals do |t|
      t.integer :user_id, null: false
      t.integer :response_id, null: false
      t.boolean :purchased, default: false

      t.timestamps
    end
  end
end
