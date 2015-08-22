module ApplicationHelper
	def solar_coin_amount(amount)
		"#{number_with_delimiter(amount)} SLR"
	end
end
