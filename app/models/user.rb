class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :destinations
  has_many :deals
  has_many :payments
  has_many :transactions

  include PermissionsConcern

	def pending_purchase_price
		payments.where(state: 1).joins("INNER JOIN deals on deals.id == payments.deal_id").sum("price")
	end
end
