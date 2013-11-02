class Question < ActiveRecord::Base

  before_validation :generate_permalink
  
  belongs_to :user

  validates :question, presence: true, uniqueness: {message: "already exists.", case_sensitive: false}, length: { maximum: 255 }
  validates :permalink, presence: true, length: { maximum: 255 }


  def to_param
    self.permalink
  end

  def already_exist?
    unless self.errors.empty?
      self.errors.full_messages.each do |message|
        return true if message == "Question already exists."
      end
    end
  end

  private
  
  def generate_permalink
    self.permalink = self.question.parameterize
  end
  


end