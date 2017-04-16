class Deal < ApplicationRecord
  belongs_to :user
  has_many :has_regions
  has_many :regions, through: :has_regions
  has_many :payments
  validates :place, presence: true, uniqueness: true
  after_create :save_regions
  before_save :default_price
  

  def regions=(value)
    @regions = value
  end
  
  	def default_price
  		self.price ||= 0
	end

	def user_already_paid? user_id
		self.payments.where(state:2).size > 0
	end

  private

  def save_regions
    @regions.each do |region_id|
      HasRegion.create(region_id: region_id,deal_id: self.id)
    end
  end
end

