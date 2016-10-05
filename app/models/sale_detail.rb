# == Schema Information
#
# Table name: sale_details
#
#  id         :integer          not null, primary key
#  sale_id    :integer
#  number     :integer
#  item_id    :integer
#  qty        :integer
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SaleDetail < ApplicationRecord
	belongs_to :sale#, inverse_of: :sale_details
	belongs_to :item

	validates :item_id, presence: true
	validates :qty, presence: true
	validates :price, presence: true


	def subtotal
		self.qty * self.price
	end
end
