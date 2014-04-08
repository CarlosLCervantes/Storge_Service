class AddQuestionIdToOption < ActiveRecord::Migration
  def change
    add_column :options, :question_id, :integer
  end
end
