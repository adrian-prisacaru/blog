class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :articles
         
  def name
    value = "#{first_name} #{last_name}"
    value.blank? ? username : value
  end
  
  def username
    email.split("@")[0]
  end
  
  def is?(role)
    self.role == role.to_s
  end
  
end
