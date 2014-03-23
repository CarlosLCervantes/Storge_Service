class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :user_id
      t.integer :invite_id

      t.timestamps
    end
  end
end
