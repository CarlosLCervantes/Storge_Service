class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.boolean :skipped, null: false, default: false

      t.timestamps
    end
  end
end
