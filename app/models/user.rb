class User < ActiveRecord::Base
  
  before_save :hash_password
  
  
  validates :email, uniqueness: true, presence: true, length: { maximum: 100 }
  validates :password, presence: true, length: { minimum: 8 }
  validates :first_name, presence: true, length: { maximum: 60 }
  validates :last_name, presence: true, length: { maximum: 50 }
  
  scope :find_by_email, ->(email) { where(email: email) }
  
  def self.encrypt(password="", salt="")
    password = Digest::SHA1.hexdigest(password)
    password = Digest::SHA1.hexdigest("#{salt} #{password}")
  end
  
  private
  
  def generate_salt
    self.salt = Digest::SHA1.hexdigest("User #{email} and #{Time.now} to make some salt.")
  end
  
  def hash_password
    generate_salt
    self.password = User.encrypt self.password, self.salt
  end
  
end