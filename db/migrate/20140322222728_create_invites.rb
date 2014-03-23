class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :user_id, null: false
      t.string :phone, null: false
      t.string :first_name, null: false
      t.string :token, null: false

      t.timestamps
    end
  end
end
