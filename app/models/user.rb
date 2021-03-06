class User < ActiveRecord::Base
  has_secure_password
  
  has_many :answers
  has_many :invites

  validates_presence_of :first_name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :phone
  validates_uniqueness_of :phone
  validates_presence_of :password_digest

  def next_question
  	#TODO: Holy fuck optimize
  	answers = self.answers.map { |a| a.question_id }
    Question.where.not(id: answers).first
  end

end