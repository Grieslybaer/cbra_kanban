module AccountAuth
  class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
    
    # Account belongs to a person
    # must be set within the application
    belongs_to :person, class_name: AccountAuth.person_class.to_s
  end
end
