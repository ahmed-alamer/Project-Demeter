module ApplicationHelper
	def solar_coin_amount(amount)
		number_with_delimiter(amount, separator: '.', delimiter: ',') + ' SLR'
	end

	def get_documentation_link(documentation_link)
		link_name = truncate(documentation_link, :length => 50, :omission => '...(Open)')
    link_to link_name, documentation_link, :target => '_blank'
	end
end
