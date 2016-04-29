module AccountAuth
	AccountAuth.user_class.class_eval do
		# Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
	end if AccountAuth.user_class.present?
end