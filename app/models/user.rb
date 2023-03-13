class User < ApplicationRecord
  
  has_secure_password
  validates :email, presence: true, :uniqueness => {:case_sensitive => false} 
  validates :name, presence: true
  # validates :password, presence: true, comparison: { equal_to: :password_confirmation }, length: {minimum: 6}
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  
  def self.authenticate_with_credentials(email, password)
    email.downcase!
    email.strip!
    @user = User.find_by_email(email)
    if @user == nil
      return nil
    end
    @user.authenticate(password)
  end 
end