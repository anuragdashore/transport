class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :bookings

	validates :name, presence: true
	validates :contact, presence: true
	validates :gender, presence: true
	validates :role_id, presence: true
	validates :age, presence: true
  
	after_create :assign_role

	private
	def assign_role
		role = Role.find_by(id: role_id)
		self.add_role role.name.to_sym
	end
end
