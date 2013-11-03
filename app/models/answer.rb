class Answer < ActiveRecord::Base
  
  validates :answer, presence: true
  belongs_to :user
  belongs_to :question
  
end