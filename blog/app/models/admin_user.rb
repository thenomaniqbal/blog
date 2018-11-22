class AdminUser < ApplicationRecord
  has_many :tasks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

after_create { |admin| admin.send_reset_password_instructions }
def password_required?
  new_record? ? false : super
end

end
