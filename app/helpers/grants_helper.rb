module GrantsHelper
	def get_panel_title(approval_code)
		case  approval_code
		when "AGRT" then "Adjustment"
		when "BGRT" then "Bounty"
		when "PGRT" then "Periodic"
		end
	end
end
