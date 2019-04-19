class User < ApplicationRecord
  has_many :reviews
  
  has_many :permissions
  has_many :roles, through: :permissions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :username, :mobile
  validates_numericality_of :mobile
  validates_length_of :mobile, is: 10

  #callback
  after_create :assign_customer_role

  def assign_customer_role
  	#binding.pry
  	Permission.create(user_id: self.id, role_id: Role.second.id)
  end 

  def role?(role)
  	self.roles.pluck(:name).include?(role)
  end                       	


end
