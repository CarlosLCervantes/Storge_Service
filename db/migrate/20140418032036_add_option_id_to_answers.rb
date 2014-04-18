class AddOptionIdToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :option_id, :integer, null: false
  end
end
