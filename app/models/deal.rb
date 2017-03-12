class Deal < ApplicationRecord
  belongs_to :user
  has_many :payments
  validates :place, presence: true, uniqueness: true
  before_save :default_price
  
  	def default_price
  		self.price ||= 0
	end

	def user_already_paid? user_id
		self.payments.where(state:2).size > 0
	end
end

