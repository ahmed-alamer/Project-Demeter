module ApproveProjectsHelper
	
	def get_project_status(status, property)
		status == nil ? "Pending" : status[property]
	end

end
