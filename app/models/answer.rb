class Answer < ActiveRecord::Base
  has_one :option
  belongs_to :question
  belongs_to :user
end