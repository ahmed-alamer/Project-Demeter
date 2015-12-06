module ApplicationHelper
	def solar_coin_amount(amount)
		number_with_delimiter(amount, separator: '.', delimiter: ',') + ' SLR'
	end

end
