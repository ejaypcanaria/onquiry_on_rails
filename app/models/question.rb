class Question < ActiveRecord::Base

  before_validation :generate_permalink

  validates :question, presence: true, length: { maximum: 255 }
  validates :permalink, presence: true, length: { maximum: 255 }


  def to_param
    self.permalink
  end

  private
  
  def generate_permalink
    self.permalink = self.question.parameterize
  end
  


end