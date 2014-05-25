class Question < ActiveRecord::Base
  has_many :options

  def to_s() return self.text end
end
