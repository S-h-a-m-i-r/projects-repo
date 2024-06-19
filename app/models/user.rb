class User < ApplicationRecord
  has_secure_password
  has_many :comments

  validates :name, presence: true,  format: { without: /\W/, message: "should not contain special characters" } 
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A.*[@$!%*?&].*\z/, message: "must contain at least one special character" }
  validates :password_confirmation, presence: true, length: { minimum: 8 }, format: { with: /\A.*[@$!%*?&].*\z/, message: "must contain at least one special character" }
  validates_confirmation_of :password, length: { minimum: 8 }, format: { with: /\A.*[@$!%*?&].*\z/, message: "must contain at least one special character" }
  
  
  before_validation :downcase_name

  private

  def downcase_name
    self.name = name.downcase if name.present?
  end

end
