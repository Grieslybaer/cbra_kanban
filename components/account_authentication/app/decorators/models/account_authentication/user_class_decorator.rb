module AccountAuthentication
	AccountAuthentication.user_class.class_eval do
		# Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
	end if AccountAuthentication.user_class.present?
end